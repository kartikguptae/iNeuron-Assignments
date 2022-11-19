create database sql_project2;
use sql_project2;


/* TAST-1 QUERY*/

create table shopping_history (
	product varchar(100) not null,
    quantity int not null,
    unit_price int not null
);
select * from  shopping_history;

insert into shopping_history values ('milk', 3, 10),
('bread', 7, 3),
('bread', 5, 2);

/* Desired Output */	
    select product, sum(unit_price * quantity) as total_price from shopping_history
    group by product;
    

/* TAST-2 QUERY*/

create table phones (
	name varchar(100) not null unique,
	phone_number int not null unique,
    primary key(phone_number)
);
drop table phones;
create table calls (
	id int not null unique,
    caller int not null,
    callee int not null,
    duration int not null,
    foreign key(caller) references phones(phone_number),
    foreign key(callee) references phones(phone_number)
);

select * from phones;
select * from calls;
    
insert into phones values ('Jack' , 1234),
('Lena' , 3333),
('Mark' , 9999),
('Anna' , 7582);	
  
insert into calls values(25, 1234, 7582, 8), 
(7, 9999, 7582, 1),
(18, 9999, 3333 , 4),
(2, 7582, 3333, 3),
(3, 3333, 1234, 1),
(21, 3333, 1234, 1);

/* Desired Output for test case 1*/	

	select name from phones p left outer join calls c
    on p.phone_number = c.caller or p.phone_number = c.callee 
    group by phone_number
    having sum(duration) >= 10
    order by name asc ;
  


insert into phones values ('John' , 6356),
('Addison' , 4315),
('Kate' , 8003),
('Ginny' , 9831);

select * from phones;
select * from calls;

insert into calls values(65, 8003, 9831, 7), 
(100, 9831, 8003, 3),
(45, 4315, 9831 , 18);

	
/* Desired Output for test case 2*/	
    
	select name from phones p left outer join calls c
    on p.phone_number = c.caller or p.phone_number = c.callee 
    group by phone_number
    having sum(duration) >= 10
    order by name asc ;
    

/* TAST-3 QUERY*/
   
create table transactions (
	amount int not null,
    dates date not null
);    
    
drop table transactions;

/* Desired Output for test case 1*/	

insert into transactions values
    (1000, '2020-01-06'),    
    (-10, '2020-01-14'),
    (-75, '2020-01-20'),
    (-5, '2020-01-25'),
    (-4, '2020-01-29'),
    (2000, '2020-03-10'),
    (-75, '2020-03-12'),
    (-20, '2020-03-15'),
    (40, '2020-03-15'),
    (-50, '2020-03-17'),
    (200, '2020-10-10'),
    (-200, '2020-10-10');
    
select * from transactions;

select (sum(a.monthly_transaction)+ b.debit_card_fine ) as account_balance from 
 (select sum(amount) as monthly_transaction , monthname(dates) as month_name from transactions group by month_name)  a ,
(select (-5*(12-count(month_name))) as debit_card_fine from
(select count(amount) as monthly_credit_transactions, sum(amount) as credit_card_transaction_amount ,
monthname(dates) as month_name from transactions where amount<0 group by month_name) x
 where x.monthly_credit_transactions>=3 and x.credit_card_transaction_amount<=-100) b  ;



/* Desired Output for test case 2*/	
	
	insert into transactions values
    (1,'2020-06-29'),
	(35,'2020-02-29'),
	(-50,'2020-02-29'),
	(-1,'2020-02-29'),
	(-200,'2020-08-29'),
    (-44,'2020-02-29'),
	(-5,'2020-02-29'),
    (1,'2020-06-29'),
    (1,'2020-06-29'),
    (-100,'2020-12-29'),
    (-100,'2020-12-29'),
    (-100,'2020-12-29');

select (sum(a.monthly_transaction)+ b.debit_card_fine ) as account_balance from 
 (select sum(amount) as monthly_transaction , monthname(dates) as month_name from transactions group by month_name)  a ,
(select (-5*(12-count(month_name))) as debit_card_fine from
(select count(amount) as monthly_credit_transactions, sum(amount) as credit_card_transaction_amount ,
monthname(dates) as month_name from transactions where amount<0 group by month_name) x
 where x.monthly_credit_transactions>=3 and x.credit_card_transaction_amount<=-100) b  ;



/* Desired Output for test case 3*/	


insert into transactions values
(6000,'2020-04-03'),
(5000,'2020-04-03'),
(4000,'2020-04-03'),
(3000,'2020-03-03'),
(2000,'2020-02-03'),
(1000,'2020-01-03');


select (sum(a.monthly_transaction)+ b.debit_card_fine ) as account_balance from 
 (select sum(amount) as monthly_transaction , monthname(dates) as month_name from transactions group by month_name)  a ,
(select (-5*(12-count(month_name))) as debit_card_fine from
(select count(amount) as monthly_credit_transactions, sum(amount) as credit_card_transaction_amount ,
monthname(dates) as month_name from transactions where amount<0 group by month_name) x
 where x.monthly_credit_transactions>=3 and x.credit_card_transaction_amount<=-100) b  ;
