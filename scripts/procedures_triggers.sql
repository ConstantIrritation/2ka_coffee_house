-- Подразумевалось, что поле component_amt в components
-- будет хранить актуальное количество товара
-- на основе поставок и заказов
-- для постоянного поддержания этой информации
-- воспользуемся процедурами и триггерами

create or replace function coffee_house.update_amt_after_purchase() returns trigger as
    $$
    begin
        update coffee_house.component
        set component_amt = (select sum(purchase_amt)
                                from coffee_house.purchase purch join coffee_house.ingredient on purch.ingredient_nm = ingredient.ingredient_nm
                                where component.component_nm = ingredient.ingredient_type
                                group by ingredient_type
                                limit 1) -
                            coalesce((
                                select  sum(component_required) * 0.001 as sum_component_required
                                    from coffee_house.products_in_order pio join coffee_house.components_in_product cip on pio.product_title = cip.product_title
                                    where component.component_nm = cip.component_nm
                                    group by cip.component_nm
                                    limit 1), 0)
        where component_nm in (select distinct component_nm from coffee_house.purchase);
        return old;
    end;
    $$ language plpgsql;

create trigger  trigger_update_amt_after_purchase
    after insert
    on coffee_house.purchase
    for each row
    execute procedure coffee_house.update_amt_after_purchase();

create trigger  trigger_update_amt_after_order
    after insert
    on coffee_house.products_in_order
    for each row
    execute procedure coffee_house.update_amt_after_purchase();

-- Рассмотрим создание заказа:
-- Раньше каждый раз при создании нового заказа его стоимость равнялась 0,
-- далее добавлялась информация о составе заказа
-- и после этого пересчитывалась стоимость заказа
-- Создадим функцию и соответствующтй триггер,
-- чтобы стоимость заказа высчитывалась автоматически

create or replace function coffee_house.update_order_cost() returns trigger as
    $$
    begin
        update coffee_house.order
        set order_cst = (select sum(product.price)
                            from coffee_house.products_in_order pio join coffee_house.product on pio.product_title = product.product_title
                            where pio.order_id = coffee_house.order.order_id
                            group by pio.order_id
                            limit 1)
    where order_id in (select distinct order_id from coffee_house.products_in_order);
    return old;
    end;
    $$ language plpgsql;

create trigger trigger_update_order_cost
    after insertЮ
    on coffee_house.products_in_order
    for row
    execute procedure coffee_house.update_order_cost();
