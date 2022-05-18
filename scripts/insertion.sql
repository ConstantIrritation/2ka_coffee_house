-- (product_title, price)
insert into coffee_house.product values ('Эспрессо 30',   60);
insert into coffee_house.product values ('Американо 200', 60);
insert into coffee_house.product values ('Американо 300', 120);
insert into coffee_house.product values ('Американо 400', 180);
insert into coffee_house.product values ('Американо 600', 240);
insert into coffee_house.product values ('Капучино 200',  60);
insert into coffee_house.product values ('Капучино 300',  120);
insert into coffee_house.product values ('Капучино 400',  180);
insert into coffee_house.product values ('Капучино 600',  240);
insert into coffee_house.product values ('Латте 200',     60);
insert into coffee_house.product values ('Латте 300',     120);
insert into coffee_house.product values ('Латте 400',     180);
insert into coffee_house.product values ('Латте 600',     240);

-- (maker_nm, country_from)
insert into coffee_house.maker values ('Lavazza',         'Italy');
insert into coffee_house.maker values ('Paulig',          'Finland');
insert into coffee_house.maker values ('Jardin',          'Switzerland');
insert into coffee_house.maker values ('Carraro',         'Italy');
insert into coffee_house.maker values ('EGOISTE',         'Germany');
insert into coffee_house.maker values ('Carte Noire',     'France');
insert into coffee_house.maker values ('Bushido',         'Japan');
insert into coffee_house.maker values ('Parmalat',        'Italy');
insert into coffee_house.maker values ('Вимм-Билль-Данн', 'Russia');
insert into coffee_house.maker values ('Danone',          'France');

-- (component_nm, component_amt)
insert into coffee_house.component values ('Кофе зерновой', 0);
insert into coffee_house.component values ('Молоко',        0);

-- (ingredient_nm, maker_nm, ingredient_type)
insert into coffee_house.ingredient values ('Lavazza Qualita Oro',                     'Lavazza',         'Кофе зерновой');
insert into coffee_house.ingredient values ('Lavazza Crema e Aroma',                   'Lavazza',         'Кофе зерновой');
insert into coffee_house.ingredient values ('Lavazza Espresso Barista',                'Lavazza',         'Кофе зерновой');
insert into coffee_house.ingredient values ('Paulig Arabica',                          'Paulig',          'Кофе зерновой');
insert into coffee_house.ingredient values ('Paulig Presidentti Original',             'Paulig',          'Кофе зерновой');
insert into coffee_house.ingredient values ('Paulig Presidentti Ruby',                 'Paulig',          'Кофе зерновой');
insert into coffee_house.ingredient values ('Jardin Ethiopia Euphoria',                'Jardin',          'Кофе зерновой');
insert into coffee_house.ingredient values ('Jardin Espresso di Milano',               'Jardin',          'Кофе зерновой');
insert into coffee_house.ingredient values ('Jardin Bravo Brazilia',                   'Jardin',          'Кофе зерновой');
insert into coffee_house.ingredient values ('Jardin Crema',                            'Jardin',          'Кофе зерновой');
insert into coffee_house.ingredient values ('Carraro Espresso Classic',                'Carraro',         'Кофе зерновой');
insert into coffee_house.ingredient values ('EGOISTE Noir',                            'EGOISTE',         'Кофе зерновой');
insert into coffee_house.ingredient values ('Carte Noire Original',                    'Carte Noire',     'Кофе зерновой');
insert into coffee_house.ingredient values ('Bushido Sensei',                          'Bushido',         'Кофе зерновой');
insert into coffee_house.ingredient values ('Bushido Red Katana',                      'Bushido',         'Кофе зерновой');
insert into coffee_house.ingredient values ('Bushido Black Katana',                    'Bushido',         'Кофе зерновой');
insert into coffee_house.ingredient values ('Parmalat ультрапастеризованное 3,5%',     'Parmalat',        'Молоко');
insert into coffee_house.ingredient values ('Parmalat ультрапастеризованное 1,8%',     'Parmalat',        'Молоко');
insert into coffee_house.ingredient values ('Домик в деревне стерилизованное 3,2%',    'Вимм-Билль-Данн', 'Молоко');
insert into coffee_house.ingredient values ('Домик в деревне стерилизованное 2,5%',    'Вимм-Билль-Данн', 'Молоко');
insert into coffee_house.ingredient values ('Простоквашино пастеризованное 2,5%',      'Danone',          'Молоко');
insert into coffee_house.ingredient values ('Простоквашино пастеризованное 3,4%-4,5%', 'Danone',          'Молоко');

-- (product_title, component_nm, component_required)
with const as (select 7 as coffee_for_single_portion)
insert into coffee_house.components_in_product values ('Эспрессо 30', 'Кофе зерновой', (select coffee_for_single_portion from const));
insert into coffee_house.components_in_product values ('Американо 200', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 2);
insert into coffee_house.components_in_product values ('Американо 300', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 3);
insert into coffee_house.components_in_product values ('Американо 400', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 4);
insert into coffee_house.components_in_product values ('Американо 600', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 6);
insert into coffee_house.components_in_product values ('Капучино 200', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 2);
insert into coffee_house.components_in_product values ('Капучино 200', 'Молоко', 120);
insert into coffee_house.components_in_product values ('Капучино 300', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 3);
insert into coffee_house.components_in_product values ('Капучино 300', 'Молоко',
                                                       (select component_required from coffee_house.components_in_product
                                                                                  where product_title = 'Капучино 200' and component_nm = 'Молоко') * 1.5);
insert into coffee_house.components_in_product values ('Капучино 400', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 4);
insert into coffee_house.components_in_product values ('Капучино 400', 'Молоко',
                                                       (select component_required from coffee_house.components_in_product
                                                                                  where product_title = 'Капучино 200' and component_nm = 'Молоко') * 2);
insert into coffee_house.components_in_product values ('Капучино 600', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 6);
insert into coffee_house.components_in_product values ('Капучино 600', 'Молоко',
                                                       (select component_required from coffee_house.components_in_product
                                                                                  where product_title = 'Капучино 200' and component_nm = 'Молоко') * 3);
insert into coffee_house.components_in_product values ('Латте 200', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 2);
insert into coffee_house.components_in_product values ('Латте 200', 'Молоко', 120);
insert into coffee_house.components_in_product values ('Латте 300', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 3);
insert into coffee_house.components_in_product values ('Латте 300', 'Молоко',
                                                       (select component_required from coffee_house.components_in_product
                                                                                  where product_title = 'Латте 200' and component_nm = 'Молоко') * 1.5);
insert into coffee_house.components_in_product values ('Латте 400', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 4);
insert into coffee_house.components_in_product values ('Латте 400', 'Молоко',
                                                       (select component_required from coffee_house.components_in_product
                                                                                  where product_title = 'Латте 200' and component_nm = 'Молоко') * 2);
insert into coffee_house.components_in_product values ('Латте 600', 'Кофе зерновой',
                                                       (select component_required from coffee_house.components_in_product where product_title = 'Эспрессо 30') * 6);
insert into coffee_house.components_in_product values ('Латте 600', 'Молоко',
                                                       (select component_required from coffee_house.components_in_product
                                                                                  where product_title = 'Латте 200' and component_nm = 'Молоко') * 3);

-- (supply_nm, supply_rate)
insert into coffee_house.supply values ('ИП Беляев',                   99);
insert into coffee_house.supply values ('КофеДом',                     5);
insert into coffee_house.supply values ('ОАО Диасофт',                 34);
insert into coffee_house.supply values ('Администрация президента',    1);
insert into coffee_house.supply values ('Кировский молочный комбинат', 17);
insert into coffee_house.supply values ('ЗАО Ардис',                   3);
insert into coffee_house.supply values ('ИП Алишер К.',                21);
insert into coffee_house.supply values ('ИвМолокоПродукт',             45);

-- (purchase_id, ingredient_nm, purchase_dt, supply_nm, purchase_amt, purchase_cst)
insert into coffee_house.purchase values (1, 'Домик в деревне стерилизованное 2,5%',     '2020-08-22', 'ИвМолокоПродукт',             40, 4764);
insert into coffee_house.purchase values (2, 'Carte Noire Original',                     '2020-10-06', 'КофеДом',                     20, 19540);
insert into coffee_house.purchase values (3, 'Простоквашино пастеризованное 3,4%-4,5%',  '2020-11-09', 'Кировский молочный комбинат', 70, 8132);
insert into coffee_house.purchase values (4, 'Paulig Presidentti Original',              '2021-01-09', 'ИП Алишер К.',                25, 30757);
insert into coffee_house.purchase values (5, 'Jardin Ethiopia Euphoria',                 '2021-06-17', 'ОАО Диасофт',                 45, 47689);
insert into coffee_house.purchase values (6, 'Bushido Red Katana',                       '2021-06-25', 'ИП Беляев',                   10, 20000);
insert into coffee_house.purchase values (7, 'Parmalat ультрапастеризованное 1,8%',      '2021-10-29', 'ИП Алишер К.',                80, 9760);
insert into coffee_house.purchase values (8, 'Lavazza Espresso Barista',                 '2021-11-24', 'Администрация президента',    20, 17000);
insert into coffee_house.purchase values (9, 'EGOISTE Noir',                             '2022-02-11', 'ЗАО Ардис',                   40, 35786);
insert into coffee_house.purchase values (10, 'Простоквашино пастеризованное 3,4%-4,5%', '2022-03-05', 'ЗАО Ардис',                   60, 7864);

-- (position_nm, position_duties, position_salary)
insert into coffee_house.position values ('Старший бариста', 'Грамотно подобрать и подготовить продукты для приготовления кофе и кофейных напитков,' ||
                                                                'Досконально владеть разнообразием рецептов приготовления кофе на основе классического эспрессо', 80000);
insert into coffee_house.position values ('Бариста', 'Знать и понимать особенности кофейных автоматов,' ||
                                                                'Профессионально готовить напитки с тщательным соблюдением пропорций и рецептур', 65000);
insert into coffee_house.position values ('Стажёр', 'Оригинально оформлять приготовленный кофе и вовремя его подавать,' ||
                                                                'Уметь понять клиента и его предпочтения и в соответствии с этим порекомендовать лучший для него напиток', 23000);
insert into coffee_house.position values ('Менеджер', 'Хорошие коммуникативные навыки и готовность общаться на разные тематики,' ||
                                                                'Серьезное отношение к работе, Достойный внешний вид', 70000);
insert into coffee_house.position values ('Уборщик', 'Способность эффективно планировать свое рабочее время,' ||
                                                                'Развитые навыки устного и письменного делового общения, Знание корпоративной культуры, делового этикета', 15000);
insert into coffee_house.position values ('Грузчик', 'Развитые презентационные навыки, Навыки работы с офисной техникой' ||
                                                                'Английский язык, Водительское удостоверение категорий «В», «С»', 17000);

-- (employee_id, employee_nm, position_nm, employee_contact, start_dt, end_dt)
insert into coffee_house.employee values (1, 'Nikita Moskalev',      'Старший бариста', '+7 (919) 479-22-79', '2020-03-15', '9999-12-31');
insert into coffee_house.employee values (2, 'Nikita Mochalov',      'Уборщик',         '+7 (919) 469-78-08', '2020-03-15', '2020-05-17');
insert into coffee_house.employee values (3, 'Arsenii Belyaev',      'Менеджер',        '+7 (919) 422-34-39', '2020-03-15', '9999-12-31');
insert into coffee_house.employee values (4, 'Sofia Samoilova',      'Стажёр',          '+7 (919) 687-79-38', '2020-03-15', '9999-12-31');
insert into coffee_house.employee values (5, 'Andrey Krotov',        'Грузчик',         '+7 (919) 086-25-50', '2020-04-07', '9999-12-31');
insert into coffee_house.employee values (6, 'Sergey Zelenkin',      'Бариста',         '+7 (919) 208-01-62', '2020-03-15', '2020-05-20');
insert into coffee_house.employee values (7, 'Vasiliy Solostovskiy', 'Бариста',         '+7 (919) 849-38-97', '2020-05-21', '2020-05-23');
insert into coffee_house.employee values (8, 'Tatiana Romanchina',   'Бариста',         '+7 (919) 852-79-11', '2020-05-24', '9999-12-31');

-- order:             (order_id, order_dt, client)nm, employee_id, order_cst)
-- products_in_order: (order_id, product_title)
insert into coffee_house.order values (1, '2020-10-03', '', 1, 0);
insert into coffee_house.products_in_order values (1, 'Эспрессо 30');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 1)
where order_id = 1;

insert into coffee_house.order values (2, '2020-11-20', 'Ivan', 8, 0);
insert into coffee_house.products_in_order values (2, 'Эспрессо 30');
insert into coffee_house.products_in_order values (2, 'Американо 200');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 2)
where order_id = 2;

insert into coffee_house.order values (3, '2021-02-04', '', 8, 0);
insert into coffee_house.products_in_order values (3, 'Капучино 600');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 3)
where order_id = 3;

insert into coffee_house.order values (4, '2021-02-15', 'Mikhail', 8, 0);
insert into coffee_house.products_in_order values (4, 'Латте 400');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 4)
where order_id = 4;

insert into coffee_house.order values (5, '2021-04-13', '', 8, 0);
insert into coffee_house.products_in_order values (5, 'Латте 600');
insert into coffee_house.products_in_order values (5, 'Американо 600');
insert into coffee_house.products_in_order values (5, 'Капучино 300');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 5)
where order_id = 5;

insert into coffee_house.order values (6, '2021-06-12', '', 1, 0);
insert into coffee_house.products_in_order values (6, 'Капучино 300');
insert into coffee_house.products_in_order values (6, 'Латте 300');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 6)
where order_id = 6;

insert into coffee_house.order values (7, '2021-09-03', 'Petr', 8, 0);
insert into coffee_house.products_in_order values (7, 'Американо 200');
insert into coffee_house.products_in_order values (7, 'Американо 300');
insert into coffee_house.products_in_order values (7, 'Американо 400');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 7)
where order_id = 7;

insert into coffee_house.order values (8, '2021-12-23', '', 8, 0);
insert into coffee_house.products_in_order values (8, 'Капучино 200');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 8)
where order_id = 8;

insert into coffee_house.order values (9, '2022-01-17', 'Anastasia', 1, 0);
insert into coffee_house.products_in_order values (9, 'Латте 400');
insert into coffee_house.products_in_order values (9, 'Латте 400');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 9)
where order_id = 9;

insert into coffee_house.order values (10, '2022-04-19', '', 8, 0);
insert into coffee_house.products_in_order values (10, 'Эспрессо 30');
insert into coffee_house.products_in_order values (10, 'Капучино 400');
update coffee_house.order
set order_cst = (select sum(pr.price) from coffee_house.products_in_order p_in join coffee_house.product pr on pr.product_title =  p_in.product_title and p_in.order_id = 10)
where order_id = 10;
