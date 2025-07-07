create database Ola;
use ola;
select * from bookings;

#1. Retrive all successful bookings.
Create view Succesful_Bookings as
select * from bookings where Booking_status = 'success';

#2. find the avg ride distance for each vehicle type.
create view Avg_ridr_distance as
select Booking_id, vehicle_type,avg(ride_distance) as avg_distance from bookings group by Booking_id, vehicle_type;

select * from Avg_ridr_distance:

#3. get the total number of cancelled ride by customer.
create view canceled_rides_by_customer as
select count(*) from bookings where booking_status = 'canceled by customer';

select * from canceled_rides_by_customer

#4. list the top 5 customers who booked the highest number of rides;
create view top_5_customers as
select Customer_ID, count(Booking_id) as total_rides from bookings
group by Customer_ID
order by total_rides desc limit 5; 

select * from top_5_customers

#5.Get the number of rides canceled by driver due to personal and car related issues:
create view canceled_by_driver as
select count(*) from bookings where canceled_rides_by_driver = 'personal & car related issue';

#6. find the max and min driver ratings for prime sedan bookings;
create  view max_min_driver_rating as
select max(driver_ratings) as max_rating, min(driver_ratings)as min_rating from bookings where vehicle_type = 'prime_sedan'

#7.retrive all rides where payment was made by using UPI;
create view UPI_payment_mode as
select customer_id, Booking_id, Booking_value from bookings where Payment_Method = 'UPI';

select * from UPI_payment_mode;

#8. Find the average customer rating per vehicle type;
create view vehicle_avg_rating as
select vehicle_type, avg(customer_rating) as avg_ratings from bookings 
group by vehicle_type;

#9 calculate the total booking value of rides completed succesfully;
create view rides_completed_succesfully as
select sum(booking_value) as total_success_rides from bookings
where Booking_status = 'success'

select * from rides_completed_succesfully;

#10. List all incomplete rides along with the reason;
create view incomplete_reason as
select incomplete_rides,incomplete_rides_reason from bookings where incomplete_rides = 'yes'

select * from  incomplete_reason 

