Create Database Ola;
Use Ola;

select * from bookings;

#1.Retrive all successfull bookings
Create View Successfull_Bookings AS
select * from bookings where Booking_Status="Success";

#1.Retrive all successfull bookings
Select * from Successfull_Bookings;

#2. Find the average ride distance for each vehicle type:
Create View average_ride_distance_for_each_vehicle_type AS
Select avg(Ride_Distance) as Avg_Distance, Vehicle_Type from Bookings group by Vehicle_Type;

#2. Find the average ride distance for each vehicle type:
Select * from average_ride_distance_for_each_vehicle_type;

--  3. Get the total number of cancelled rides by customers:
create view total_number_of_cancelled_rides_by_customers AS
select count(*) as total_num from Bookings where Booking_Status="Canceled by Driver";

#3. Get the total number of cancelled rides by customers
Select * from total_number_of_cancelled_rides_by_customers;

--  4. List the top 5 customers who booked the highest number of rides:
Create View top_5_customers_who_booked_the_highest_number_of_rides AS
Select Customer_ID, count(Booking_ID) as Total_rides from Bookings group by Customer_ID Order by Total_rides DESC LIMIT 5;

#4. List the top 5 customers who booked the highest number of rides
Select * from top_5_customers_who_booked_the_highest_number_of_rides;

--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View number_of_rides_cancelled_by_drivers_due_to_pc_related_issues AS
Select count(*) as total_rides from Bookings where Canceled_Rides_by_Driver="Personal & Car related issue";

#5. Get the number of rides cancelled by drivers due to personal and car-related issues
Select * from number_of_rides_cancelled_by_drivers_due_to_pc_related_issues;

--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_min_Driver_rating AS
Select max(Driver_Ratings) AS Max_rating, min(Driver_Ratings) AS Min_rating from Bookings where Vehicle_Type="Prime Sedan";

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
select * from Max_min_Driver_rating;

--  7. Retrieve all rides where payment was made using UPI:
Create view rides_payment_as_upi AS
Select * from Bookings where Payment_Method="UPI";

#7. Retrieve all rides where payment was made using UPI
Select * from rides_payment_as_upi;

--  8. Find the average customer rating per vehicle type:
Create View avg_cust_rating_per_vehicle_type AS
Select Vehicle_Type, avg(Customer_Rating) as avg_Customer_rating from Bookings group by Vehicle_Type;

# 8. Find the average customer rating per vehicle type
Select * from avg_cust_rating_per_vehicle_type;

--  9. Calculate the total booking value of rides completed successfully:
Create View Total_booking_values_completed_as_successfull AS
Select sum(Booking_Value) as Total_boooking_value from Bookings where Booking_Status="Success";

# 9. Calculate the total booking value of rides completed successfully
select * from Total_booking_values_completed_as_successfull;

--  10. List all incomplete rides along with the reason:
Create View Incomple_rides_reason AS
Select Booking_ID, Incomplete_Rides_Reason from Bookings where Incomplete_Rides="Yes";

# 10. List all incomplete rides along with the reason
Select * from Incomple_rides_reason;