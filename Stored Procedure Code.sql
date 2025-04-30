
-- AddBooking Procedure
delimiter $$
CREATE PROCEDURE AddBooking(in booking_id int, in customer_id int , in table_no int, in booking_date date)
begin
	insert into bookings(bookingid, customerid, tableno, bdate)
    values (booking_id, customer_id, table_no, booking_date);
    select concat('New booking added') as Confimation;
end $$


-- AddValidBooking Procedure
delimiter $$
CREATE PROCEDURE AddValidBooking(in book_date date, in table_no int)
begin
	declare check_booking int; 
    -- Start transaction
    Start transaction;
    
    -- Check if a table alread booked on certain date
    select count(*) into check_booking from bookings 
    where bdate = book_date and tableno = table_no;
    
    if check_booking > 0 then 
		rollback;
		select concat('Table ', table_no, ' is already booked.- book cancelled.') as booking_message;
	else
		insert into bookings (BookingID, Bdate, TableNo, CustomerID)
        values (6, book_date, table_no, 1);
        commit;
        select concat('Table ', table_no, ' is booked on', book_date, ' successfully.') as booking_message;
    end if;
end $$


-- CancelBooking Procedure
delimiter $$
CREATE PROCEDURE CancelBooking(in booking_id int)
begin
	delete from bookings where bookingid = booking_id;
    select concat('Booking ', booking_id, ' cancelled') as confirmation;
end $$

-- CheckBooing Procedure
delimiter $$
CREATE DEFINER=`admin`@`%` PROCEDURE CheckBooking(in book_date date, in table_no int)
begin
	declare table_status int;
    -- Check if table is booked on that date
    select count(*) into table_status from bookings
    where bdate = book_date and tableno = table_no;
    -- Return message base on booking status 
    if table_status > 0 then 
		select concat('Table is', table_no ,' alread booked.') as booking_status;
	else
		select concat('Table is ', table_no, ' is available to book.') as booking_status;
	end if;
end $$


-- UpdateBooking Procedure
CREATE PROCEDURE UpdateBooking(in booking_id int, in booking_date date)
begin
	update bookings
    set bdate = booking_date
	where bookingid = booking_id;
    select concat('Booking ', booking_id, ' updated') as Confirmation;
end $$


-- GetMaxQuantity Procedure
CREATE PROCEDURE GetMaxQuantity()
select max(quantity) from orders;



