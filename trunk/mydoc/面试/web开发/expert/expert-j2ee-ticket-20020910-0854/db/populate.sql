
insert into genre (id, name) values (1, 'Rock');
insert into genre (id, name) values (2, 'Ballet');
insert into genre (id, name) values (3, 'Theatre');
insert into genre (id, name) values (4, 'Classical');
insert into genre (id, name) values (5, 'Musical');
insert into genre (id, name) values (6, 'Opera');

insert into seating_plan (id, name) values (1, 'Standard Opera Seating');

insert into show (id, name, genre_id, seating_plan_id) values (1, 'Romeo and Juliet', 3, 1);
insert into show (id, name, genre_id, seating_plan_id) values (2, 'Waiting for Godot', 3, 1);
insert into show (id, name, genre_id, seating_plan_id) values (3, 'Giselle', 2, 1);
insert into show (id, name, genre_id, seating_plan_id) values (4, 'Tristan und Isolde', 6, 1);
insert into show (id, name, genre_id, seating_plan_id) values (5, 'La Traviata', 6, 1);
insert into show (id, name, genre_id, seating_plan_id) values (6, 'Miss Saigon', 5, 1);
insert into show (id, name, genre_id, seating_plan_id) values (7, 'Cats', 5, 1);




insert into seat_class (id, code, description) values (1, 'AA', 'Premium Reserve');
insert into seat_class (id, code, description) values (2, 'A', 'A Reserve');




insert into price_structure (id, name) values (1, 'Standard opera pricing');

insert into price_band (id, price_structure_id, seat_class_id, price) 
	values (1, 1, 1, 195);
insert into price_band (id, price_structure_id, seat_class_id, price) 
	values (2, 1, 2, 160);



insert into performance (id, date_and_time, show_id, price_structure_id) 
	values (1, timestamp'2002-10-12 19:30:00', 1, 1);

insert into performance (id, date_and_time, show_id, price_structure_id) 
	values (2, timestamp'2002-01-14 19:30:00', 1, 1);


insert into seat(id, name, left, right, row_or_box, row_pos) values (1, 'A1', null, 2, 1, 1);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (1, 1, 2);

insert into seat(id, name, left, right, row_or_box, row_pos) values (2, 'A2', 1, 3, 1, 2);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (2, 1, 1);

insert into seat(id, name, left, right, row_or_box, row_pos) values (3, 'A3', 2, 4, 1, 3);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (3, 1, 1);

insert into seat(id, name, left, right, row_or_box, row_pos) values (4, 'A4', 3, 5, 1, 4);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (4, 1, 1);

insert into seat(id, name, left, right, row_or_box, row_pos) values (5, 'A5', 4, 6, 1, 5);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (5, 1, 2);

insert into seat(id, name, left, right, row_or_box, row_pos) values (6, 'A6', 5, null, 1, 6);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (6, 1, 2);

insert into seat(id, name, left, right, row_or_box, row_pos) values (7, 'B1', null, 8, 2, 1);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (7, 1, 2);

insert into seat(id, name, left, right, row_or_box, row_pos) values (8, 'B2', 7, 9, 2, 2);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (8, 1, 1);

insert into seat(id, name, left, right, row_or_box, row_pos) values (9, 'B3', 8, 10, 2, 3);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (9, 1, 1);

insert into seat(id, name, left, right, row_or_box, row_pos) values (10, 'B4', 9, 11, 2, 4);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (10, 1, 1);

insert into seat(id, name, left, right, row_or_box, row_pos) values (11, 'B5', 10, 12, 2, 5);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (11, 1, 2);

insert into seat(id, name, left, right, row_or_box, row_pos) values (12, 'B6', 11, null, 2, 6);
insert into seat_plan_seat(seat_id, seating_plan_id, seat_class_id) values (12, 1, 2);





rem DON'T NEED THIS ANY MORE: have a trigger
rem insert into seat_status (performance_id, seat_id, price_band_id)
rem	select performance.id, seat_plan_seat.seat_id, price_band.id
rem		from seat_plan_seat, performance, show, price_band
rem		where 
rem			performance.id in (select id from performance)
rem			and show.seating_plan_id = seat_plan_seat.seating_plan_id
rem			and price_band.price_structure_id = performance.price_structure_id
rem			and price_band.seat_class_id = seat_plan_seat.seat_class_id;



