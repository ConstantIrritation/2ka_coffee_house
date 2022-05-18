-- Данное представление показывает обезличенные данные посетителей
create view coffee_house.protected_visitors as
    select order_id, md5(client_nm), order_dt, order_cst, empl.employee_nm
    from coffee_house.order ord join coffee_house.employee empl on ord.employee_id = empl.employee_id
    where client_nm not like '';

-- Данное представление сокрывает номера телефонов сотрудников
create view coffee_house.protected_employees as
    select employee_nm, position_nm, substr(employee_contact, 1, 9) || '***-**-' || substr(employee_contact, 10, 2) as employee_contact
    from coffee_house.employee;

-- Данное представление позволяет узнать себестоимость каждой позиции меню
create view coffee_house.product_cost_price as
    with component_cost_price as (
        select avg(purch.purchase_cst / purch.purchase_amt) as avg_cost, ingredient_type
        from coffee_house.ingredient ing join coffee_house.purchase purch on ing.ingredient_nm = purch.ingredient_nm
        group by ing.ingredient_type
    )
    select product.product_title, sum(component_required * avg_cost / 1000), price
    from coffee_house.components_in_product cip join component_cost_price csc on csc.ingredient_type = cip.component_nm
    join coffee_house.product on cip.product_title = product.product_title
    group by product.product_title;

-- Данное представление позволяет узнать обязанности каждого сотрудника
create view coffee_house.employee_info as
    select employee_nm, pos.position_nm, position_duties as duties
    from coffee_house.employee emlp join coffee_house.position pos on emlp.position_nm = pos.position_nm;

-- Данное представление позволяет узнать страну-производителя для товара в каждой поставке
create view coffee_house.purchase_countries as
    select  purchase_id, ingredient.ingredient_nm, purchase_dt , maker.country_from
    from coffee_house.purchase purch join coffee_house.ingredient on purch.ingredient_nm = ingredient.ingredient_nm
    join coffee_house.maker on ingredient.maker_nm = maker.maker_nm;

-- Данное представление позволяет узнать средний рейтинг поставщиков для поставляемых товаров
create view coffee_house.average_supply_rate as
    select ingredient_nm, avg(supply_rate) as avg_rate
    from coffee_house.purchase purch join coffee_house.supply on purch.supply_nm = supply.supply_nm
    group by purch.ingredient_nm
    order by avg_rate desc;