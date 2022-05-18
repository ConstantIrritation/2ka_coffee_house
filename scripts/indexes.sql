-- Иногда нам может понадобиться поиск по названию компоненты/ингредиента/продукта, которые расположены не в алфавитном порядке
-- Воспользуемся индексами для быстрого поиска, для регистронезависимости поиска используем uppercase
create index on coffee_house.component(upper(component_nm));
create index on coffee_house.ingredient(upper(ingredient_nm));
create index on coffee_house.product(upper(product_title));
create index on coffee_house.components_in_product(upper(product_title));

-- Аналогично для поставщиков, работников, должностей, производителей
create index on coffee_house.employee(upper(employee_nm));
create index on coffee_house.position(upper(position_nm));
create index on coffee_house.supply(upper(supply_nm));
create index on coffee_house.maker(upper(maker_nm));

-- Поставки, заказы упорядочим по дате по возрастанию
create index on coffee_house.purchase(purchase_dt asc);
create index on coffee_house.order(order_dt asc);
