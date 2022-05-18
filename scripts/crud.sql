-- create <-> insert
insert into coffee_house.product values ('Печенье 1 шт.', 100);
insert into coffee_house.component values ('Печенье', 0);
insert into coffee_house.maker values ('Mondelez', 'USA');
insert into coffee_house.ingredient values ('Юбилейное', 'Mondelez', 'Печенье');
insert into coffee_house.components_in_product values ('Печенье 1 шт.', 'Печенье', 1);

-- read <-> select
select avg(price)
from coffee_house.product;

select client_nm
from coffee_house.order
where client_nm not like '';

--update
update coffee_house.position
set position_salary = 23100
where position_nm = 'Стажёр';

update coffee_house.product
set price = 120
where price = 100;

--delete
delete from coffee_house.ingredient
where ingredient_nm = 'Carraro Espresso Classic';
