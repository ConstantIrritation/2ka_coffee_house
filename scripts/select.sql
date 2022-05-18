-- В результате выполнения данного select-запроса будут получены производители, продуктов которых больше одного
select maker_nm
from coffee_house.ingredient
group by maker_nm
having count(maker_nm) > 1;

-- В результате выполнения данного select-запроса будут получены работники, упорядоченные по суммарной стоимости принятых заказов
select empl.employee_nm, sum(ord.order_cst) as sum
from coffee_house.employee empl join coffee_house.order  ord on empl.employee_id = ord.employee_id
group by empl.employee_nm
order by sum desc;

-- В результате данного select-запроса будет получена средняя цена поставок для каждого типа ингредиента
-- Будут выведены: ингредиент, производитель, дата закупки, поставщик, тип ингредиента,
-- цена данной поставки (для 1 ед. товара), средняя цена поставок данного типа (для 1 ед. товара)
select ing.ingredient_nm, ing.maker_nm, purch.purchase_dt, purch.supply_nm, ing.ingredient_type, purch.purchase_cst / purch.purchase_amt as buy_cst,
       avg(purch.purchase_cst / purch.purchase_amt) over (partition by ing.ingredient_type) as avg_buy_cst
from coffee_house.ingredient ing join coffee_house.purchase purch on ing.ingredient_nm = purch.ingredient_nm;

-- В результате выполнения данного select-запроса будут выведены работники, отсортированнве по выдаваемой зарплате
select employee_nm, pos.position_salary, rank() over (order by pos.position_salary desc)
from coffee_house.employee empl join coffee_house.position pos on empl.position_nm = pos.position_nm;

-- В результате выполнения данного select-запроса будет получено количество различных ингредиентов, выпускаемых производителем,
-- каждый из которых отсортирован внутри своей страны
-- Будут выведены: производитель, страна, количество ингредиентов, выпускаемых данным производителем, место производителя внутри страны
select mak.maker_nm, country_from, ingredients_count, rank() over (partition by country_from order by ingredients_count desc)
from (select ing.maker_nm, count(*) as ingredients_count
    from coffee_house.ingredient ing
    group by ing.maker_nm) as maker_count
join coffee_house.maker mak on maker_count.maker_nm = mak.maker_nm;

-- В результате выполнения данного select-запросы будут получены суммарная стоимость поставок определенного ингредиента и разница между поставками,
-- поставки будут ранжированы по дате
-- Будут выведены: номер поставки данного ингредиента, ингредиент, производитель, суммарная стоимость поставок данного ингредиента,
-- дата поставки, дата предыдущей поставки данного ингредиента
select rank() over (partition by purch.ingredient_nm order by purch.purchase_dt),
       purch.ingredient_nm, maker_nm,
       sum(purchase_cst) over (partition by ing.ingredient_nm),
       purchase_dt,
       lag(purchase_dt) over (partition by purch.ingredient_nm order by purchase_dt)
from coffee_house.purchase purch
join coffee_house.ingredient ing on purch.ingredient_nm = ing.ingredient_nm