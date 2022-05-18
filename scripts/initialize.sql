create schema coffee_house;

create table coffee_house.product (
    product_title varchar(100) primary key,
    price integer not null
);

create table coffee_house.maker (
    maker_nm varchar(100) primary key,
    country_from varchar(100) not null
);

create table coffee_house.component (
    component_nm varchar(100) primary key,
    component_amt integer not null
);

create table coffee_house.ingredient (
    ingredient_nm varchar(100) primary key,
    maker_nm varchar(100) not null,
    ingredient_type varchar(100) not null,

    foreign key (maker_nm) references coffee_house.maker(maker_nm),
    foreign key (ingredient_type) references coffee_house.component(component_nm)
);

create table coffee_house.supply (
    supply_nm varchar(100) primary key,
    supply_rate integer not null
);

create table coffee_house.purchase (
    purchase_id integer primary key,
    ingredient_nm varchar(100) not null,
    purchase_dt date not null,
    supply_nm varchar(100) not null,
    purchase_amt integer not null,
    purchase_cst integer not null,

    foreign key (ingredient_nm) references coffee_house.ingredient(ingredient_nm),
    foreign key (supply_nm) references coffee_house.supply(supply_nm)
);

create table coffee_house.components_in_product (
    product_title varchar(100) not null,
    component_nm varchar(100) not null,
    component_required integer not null,

    primary key (product_title, component_nm),
    foreign key (product_title) references coffee_house.product(product_title),
    foreign key (component_nm) references coffee_house.component(component_nm)
);

create table coffee_house.position (
    position_nm varchar(100) primary key,
    position_duties varchar(300) not null,
    position_salary integer not null
);

create table coffee_house.employee (
    employee_id integer primary key ,
    employee_nm varchar(100) not null,
    position_nm varchar(100) not null,
    employee_contact varchar(50),
    start_dt date not null,
    end_dt date not null,

    foreign key (position_nm) references coffee_house.position(position_nm)
);

create table coffee_house.order (
    order_id integer primary key,
    order_dt date not null,
    client_nm varchar(100),
    employee_id integer not null,
    order_cst integer not null,

    foreign key (employee_id) references coffee_house.employee(employee_id)
);

create table coffee_house.products_in_order (
    order_id integer not null,
    product_title varchar(100) not null,

    foreign key (order_id) references coffee_house.order(order_id),
    foreign key (product_title) references coffee_house.product(product_title)
);