
rem Oracle 8.1.7 schema for Ticketing application

rem Author: Rod Johnson
rem "Expert One-on-One J2EE", Wrox Press, 2002


rem =======================================================================
rem 
rem =======================================================================
create table genre (
	id numeric primary key,
	name varchar(32)
)
organization index;



rem =======================================================================
rem
rem =======================================================================
create table seating_plan (
	id numeric primary key,
	name varchar(32) not null
)
organization index;


rem =======================================================================
rem Each show has a seating plan
rem =======================================================================
create table show (
	id numeric primary key,
	name varchar(32),
	genre_id numeric not null references genre,
	seating_plan_id numeric not null references seating_plan
)
organization index;





rem =======================================================================
rem Deferrable syntax means that L and R checks are made only when a tx
rem is complete. Otherwise we would have a nightmare of ordering when populating
rem this table.
rem
rem row_or_box and row_pos are not presently used,
rem but might enable us to establish how far non-adjacent seats are from
rem each other.
rem
rem =======================================================================
create table seat (
	id numeric primary key,
	name varchar(5) not null,
	row_or_box numeric not null,
	row_pos numeric not null,
	left numeric references seat initially deferred deferrable,
	right numeric references seat initially deferred deferrable
)
organization index;


rem =======================================================================
rem Code is of the form AA
rem Look up /images/seatingplans/aa.gif for image
rem =======================================================================
create table seat_class (
	id numeric primary key,
	code varchar(5) not null,
	description varchar (200) not null
);


rem =======================================================================
rem join table between seating_plan and seat
rem =======================================================================
create table seat_plan_seat (
	seat_id numeric references seat,
	seating_plan_id numeric references seating_plan,
	seat_class_id numeric references seat_class,
	primary key(seat_id, seating_plan_id)
);




rem =======================================================================
rem Allows for standard price structures
rem =======================================================================
create table price_structure (
	id numeric primary key,
	name varchar(80)
)
organization index;

rem check to ensure that all price bands are present? deferred


rem =======================================================================
rem A price band associates a price with a seat class
rem =======================================================================
create table price_band (
	id numeric primary key,
	price_structure_id numeric references price_structure,
	seat_class_id numeric not null references seat_class,
	price float not null
)
organization index;


rem =======================================================================
rem A performance is associated with a price structure
rem 
rem A trigger on insertions will populate seat_status table
rem =======================================================================
create table performance (
	id numeric primary key,
 	date_and_time date not null,
	show_id numeric references show,
	price_structure_id references price_structure
)
organization index;



rem =======================================================================
rem 
rem =======================================================================
create table registered_user (
	id numeric primary key,
	email varchar(40) not null,
	password varchar(40) not null,
	card_street varchar(40) not null,
	card_line2 varchar(40),
	card_city varchar(40) not null,
	card_postcode varchar (10) not null,
	delivery_street varchar(40),
	delivery_line2 varchar(40),
	delivery_city varchar(40),
	delivery_postcode varchar (10)
);

rem index to allow users to log in quickly
create index registered_user_index on registered_user (email, password);


rem =======================================================================
rem This table is completely independent of any other table. It's
rem a snapshot of the information submitted on the payment details form,
rem whether or not that came from the registered_user table.
rem authorization code MUST be set before the transaction completes;
rem otherwise it will roll back.
rem Thus we don't have a foreign key to an address table, as the address
rem might be updated.
rem Each row in this table should be immutable.
rem email must be supplied
rem registered_user_id is non null if a registered user made the purchase
rem We can't rely on email for the link, as a user may purchase tickets and
rem subsequently register. We want to know whether they were registered at
rem the time of purchase.
rem If delivery address is null, it's the same as card address
rem =======================================================================
create table purchase (
	id numeric primary key,
	authorization_code varchar(32) not null initially deferred deferrable,
	purchase_date date not null,
	email varchar(32) not null,
	registered_user_id numeric references registered_user,
	card_street varchar(40) not null,
	card_line2 varchar(40),
	card_city varchar(40) not null,
	card_postcode varchar (10) not null,
	delivery_street varchar(40),
	delivery_line2 varchar(40),
	delivery_city varchar(40),
	delivery_postcode varchar (10)
);

rem Java code need never know about the purchase_date:
rem it's only interested in
rem the authorization code
create or replace trigger purchase_date
	before insert on purchase for each row
	begin
		:new.purchase_date := sysdate;
	end;
/



rem =======================================================================
rem Rows in this table represent reservations or confirmed bookings.
rem Reservations are valid if the reserved_until date is in the future.
rem A row indicates a confirmed (paid for) booking if the authorization_code
rem reference to the purchase table is non null.
rem =======================================================================
create table booking (
	id numeric primary key,
	purchase_id numeric references purchase,
	date_made date,
	reserved_until date,
 	price float not null
)
organization index;



rem =======================================================================
rem Denormalization for performance and to simplify operations
rem
rem One row is added for each seat in each performance, to allow
rem for quick querying. This could also simply support functionality
rem such as taking seats offline if desired
rem offered char not null constraint check_offered 
rem          check (offered in ('Y', 'N')),
rem offered: Y or N: boolean to indicate whether the seat is for sale.
rem
rem Note that the redundant data in this table is immutable,
rem so data can never get out of synch. We never change price bands
rem for a performance; however the existence of this table doesn't
rem prevent us from changing the price associated with that price band.
rem
rem We will look up seats by performance and seat_id (both parts of the primary key)
rem so we use an Oracle Index Organized Table (IOT) instead of an ordinary
rem heap organized table. See "Expert One-on-One Oracle": 224.
rem =======================================================================
create table seat_status (
	performance_id numeric not null references performance,
	seat_id numeric not null references seat,
	price_band_id numeric not null references price_band,
	booking_id numeric references booking,
	primary key(performance_id, seat_id)
)
organization index;



rem =======================================================================
rem Triggers to create and delete
rem denormalized seat_status rows on insertion of a performance
rem =======================================================================
create or replace trigger performance_seat_status
	after insert on performance for each row
	begin
		insert into seat_status (performance_id, seat_id, price_band_id)
			select :new.id, seat_plan_seat.seat_id, price_band.id
				from seat_plan_seat, show, price_band
				where 
					show.seating_plan_id = seat_plan_seat.seating_plan_id
					and price_band.price_structure_id = :new.price_structure_id
					and price_band.seat_class_id = seat_plan_seat.seat_class_id;

	end;
/

create or replace trigger performance_seat_status_del
	before delete on performance for each row
	begin
		delete from seat_status where performance_id = :old.id;
	end;
/


rem =======================================================================
rem Sequence to create primary keys for the booking table.
rem This is the Oracle way of doing what some databases
rem term "autoincrement". Note that we choose to create primary keys in the
rem database rather than in Java code.
rem =======================================================================
create sequence booking_seq 
	start with 1 
	increment by 1 
nomaxvalue;


rem =======================================================================
rem Sequence to create primary keys for the registered_users table
rem =======================================================================
create sequence registered_users_seq 
	start with 1 
	increment by 1 
nomaxvalue;

rem =======================================================================
rem Sequence to create primary keys for the purchase table
rem =======================================================================
create sequence purchase_seq 
	start with 1 
	increment by 1 
nomaxvalue;


	
rem =======================================================================
rem View of the seat_status table limited to those seats that are currently
rem available (not reserved or sold).
rem This view uses an Oracle-syntax (pre 9i, which supports standard syntax)
rem outer join as the basis for a view. The aim is to simplify calling code.
rem Calling code will not modify this view: it's modified through a stored
rem procedure.
rem =======================================================================
create or replace 
	view available_seats as
	select seat_status.seat_id, seat_status.performance_id, 
	seat_status.price_band_id
		from seat_status, booking
		where 
			booking.purchase_id is null
			and (booking.reserved_until is null or 
				booking.reserved_until < sysdate )
		and seat_status.booking_id = booking.id(+) ;
		



rem =======================================================================
rem The following type definitions are required to allow us to pass an
rem array parameter into the book_seats procedure
rem =======================================================================
create or replace type seatobj as object(id numeric);
/

create or replace type seat_range as table of seatobj;
/


rem =======================================================================
rem PL/SQL stored procedure that allows a range of seats to be reserved
rem in a single operation. This makes reservations; it doesn't purchase seats.
rem
rem performance_id: id of the performance to reserve for
rem seats: PL/SQL table of seatobj. Enables an array to be passed in. 
rem hold_till: date we must reserve the seats until. 
rem booking_id: out parameter -- the pk of the new booking 
rem =======================================================================
create or replace
procedure reserve_seats(perf_id in numeric, seats in seat_range, price float, hold_till date, new_booking_id out number)
as 
begin
	-- Get a new pk for the booking table
	select booking_seq.nextval into new_booking_id from dual;
	
	-- Create a new booking
	insert into booking(id, date_made, price, reserved_until) values (new_booking_id, sysdate, price, hold_till);

	-- Associate each seat with the booking
	-- We must loop over every element in the table: it's the only
	-- way to do it. See "Inserting Oracle Data" at 
	-- http://info-it.umsystem.edu/oradocs/doc/server/doc/PLS23/ch4.htm#toc038
	for i in 1..seats.count loop
		-- We don't check if it's already booked
		-- We rely on locking?
		update seat_status 
			set booking_id = new_booking_id
			where seat_id = seats(i).id
			and performance_id = perf_id;
	end loop;
end;
/


rem =======================================================================
rem PL/SQL stored procedure to book
rem Doesn't check whether these seats have been sent elswhere:
rem arguably it should
rem =======================================================================
create or replace
procedure create_purchase_record(booking_id in number, new_purchase_id out number)
as 
begin
	
	select purchase_seq.nextval into new_purchase_id from dual;
	
	-- Create a new purchase
	-- auth code must be set in the same tx
	insert into purchase (id, authorization_code, email, card_street, card_city, card_postcode)
		values (new_purchase_id, 'PENDING', 'rod.johnson@interface21.com', 'Roan St', 'London', 'SE10');
		
	update booking set purchase_id = new_purchase_id
		where id = booking_id;
end;
/
