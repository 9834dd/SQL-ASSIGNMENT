use mavenmovies;
#question 1
select count(rental_id) as total_no_of_rental from rental;
#question2
select return_date,rental_date, datediff(return_date,rental_date) as rental_duration from rental;

#question3
select upper(first_name),upper(last_name) from actor;
#question4
select rental_id ,month(rental_date) from rental;
  
  
  ##### GROUP  BY
#question5
select customer_id,count(rental_id) from rental group by customer_id;
#quesion 6

select sum(total_sales) from sales_by_store group by store;

### joins
#question7
select title,first_name,last_name from film inner join inventory on film.film_id=inventory.film_id inner join rental on inventory.inventory_id=rental.inventory_id inner join  customer on rental.customer_id=customer.customer_id;

#question 8
select first_name ,last_name  from actor inner  join film_actor on actor.actor_id=film_actor.actor_id inner join film on film_actor.film_id=film.film_id where film.title="Gone with the Wind.";

##Group BY
#question 1
select film_category.category_id,count(rental_id) as total_rentals from rental inner join inventory on rental.inventory_id =inventory.inventory_id inner join film on inventory.film_id =film.film_id inner join film_category on film.film_id =film_category.film_id group by film_category.category_id;
#QUESTION 2
select language.name, avg(rental_rate) from film  inner join language on film.language_id=language.language_id group by language.name;

# joins
#question3
select concat(first_name,"  ",last_name) as customer_name,sum(payment.amount)  from customer inner join payment on customer.customer_id=payment.customer_id  inner join rental on payment.customer_id=rental.customer_id group by rental.rental_id;
#question4
select concat(first_name," ",last_name) as customer_name,city.city,group_concat(distinct film.title order by film.title) as movie_rented from customer inner join address on customer.address_id=address.address_id inner join city on address.city_id=city.city_id inner join address on city.city_id =address
.city_id inner join store on address_id=store.address_id inner join inventory on store.store_id=inventroy.store_id inner join rental on invnetory.inventory_id=rental.invnetory_id inner join film on inventory.film_id=film.film_id group by city;

#Adnaced join and group by
#question 5
select film.title,count(rental_id) from rental inner join inventory on rental.inventory_id =inventory.inventory_id inner join film on inventory.film_id =film.film_id  group by film.title limit 5 ;
#question 6
select customer.customer_id, concat( customer.first_name,"  ",customer.last_name) as customer_name from customer inner join rental on customer.customer_id=rental.customer_id inner join inventory on rental.inventory_id=inventory.inventory_id WHERE inventory.store_id IN(1, 2) group by customer.customer_id,customer.first_name,customer.last_name HAVING COUNT(DISTINCT inventory.store_id)=2;
 
