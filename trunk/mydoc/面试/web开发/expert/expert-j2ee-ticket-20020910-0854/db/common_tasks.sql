
rem set autotrace traceonly

alter session set isolation_level=read committed;


rem get current genres: two equivalents
select distinct genre.id as id, genre.name as name from genre, show where genre.id = show.genre_id

select genre.id as id, genre.name as name from genre
where (select count(*) from show where show.genre_id = genre.id) > 0;





rem Get seat ids for performance

select fk_seat_id
	from seat_status
	where seat_status.fk_performance_id=&pid;


rem Get price of available seats in a given class for a given performance

select fk_seat_id, price_band.price 
	from seat_status, price_band
	where 
		seat_status.fk_performance_id = &pid
		and seat_status.fk_price_band_id = &cid
		and seat_status.fk_booking_id is NULL
		and price_band.price_band_id = seat_status.fk_price_band_id;
		
rem get price bands for performance

select price_band_id, price 
from price_band
where price_band.fk_price_structure_id
= (select fk_price_structure_id from performance where performance_id = 1)
order by price desc;
		
		
rem get performance seating data

select seat_id as id, seat.name as name, seat_status.fk_price_band_id as class_id, seat.left as left, seat.right as right
	from seat_status, seat
	where seat_status.fk_performance_id=1
	and seat.seat_id = seat_status.fk_seat_id;
		
		
		

rem book all available seats for a given performance
	

create or replace type seatobj as object(id numeric);


create or replace type seat_range as table of seatobj;



rem additional parameter: how long

create or replace
procedure book_seats(performance_id in numeric, seats in seat_range, booking_id out number)
as 
begin
	select booking_seq.nextval into booking_id from dual;
	insert into booking(booking_id, date_made, reserved_until) values(booking_id, sysdate, sysdate + 1);

	for i in 1..seats.count loop
		update seat_status 
			set fk_booking_id = booking_id 
			where seat_status.fk_seat_id = seats(i).id
				and seat_status.fk_performance_id = performance_id;
	end loop;
	
	
end;
/


-- rem Oracle 8 syntax for outer join.
-- 9i also supports standard syntax
-- includes seat_status with null bookings
-- excludes bookings that are confirmed
select fk_seat_id, booking.reserved_until
	from seat_status, booking
	where 
		seat_status.fk_performance_id = 1
		and seat_status.fk_price_band_id = 1
		and booking.authorization_code is null
		and (booking.reserved_until is null or booking.reserved_until < sysdate )
		and seat_status.fk_booking_id = booking.booking_id(+) ;

	
select fk_seat_id
	from seat_status, booking
	where 
		seat_status.fk_performance_id = 1
		and seat_status.fk_price_band_id = 1
	and seat_status.fk_booking_id = booking.booking_id;



rem this uses the join view
rem to simplify the query
select seat_id as id
	from available_seats
	where 
		performance_id = 1
		and price_band_id = 1 for update;

rem won't block because of for update
select count(seat_id)
	from available_seats
	where 
		performance_id = 1
		and price_band_id = 1;



-- DOESN't WORK
-- was trying to reference seat type
create or replace package boxoffice as


procedure book_seats(performance_id in numeric, seats in seat_range, booking_id out number);

end boxoffice;
/

create or replace body boxoffice as










execute make_booking (select 1,2,3 from seat, &bid);



insert into booking (id, reserved_until) values (1, sysdate + 1);
update seat_status set booking_id=1 where seat_id = 8 and performance_id = 1 and price_band_id = 1;

insert into booking (id, reserved_until) values (2, sysdate + 1);
update seat_status set booking_id=1 where seat_id = 4 and performance_id = 1 and price_band_id = 1;



rem unbook seats 

update seat_status set booking_id = null;

delete from booking;



insert into purchase (email, card_street, card_city, card_postcode)
values ('rod.johnson@interface21.com', 'Roan St', 'London', 'SE10');

update booking set purchase_id = 5
	where id = 53;
	
update purchase set authorization_code='xyz' where id=5;	
	
	
	
select seat_id from seat_status, booking where booking.authorization_code = 'xytxzz'
	and seat_status.booking_id = booking.id;
	
	
rem delete reservations but not bookings
update seat_status set booking_id = null 
	where booking_id not in 
		(select id from booking where authorization_code is not null);
		
		
		
update seat_status set booking_id = null;
delete from booking;
delete from purchase;

 		
update seat_status set booking_id = null where booking_id=1
and select purchase_id from booking where booking_id = booking_id = null;



rem find seat types for show

select distinct show.id, seat_plan_seat.seat_class_id 
from show, seat_plan_seat 
where seat_plan_seat.seating_plan_id = show.seating_plan_id;