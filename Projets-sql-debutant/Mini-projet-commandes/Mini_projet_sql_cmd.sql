create table baby_names(
gender varchar2(10),
name varchar2(50),
total int
);

-- general information
select * 
from baby_names;

--  order by popularite

select * 
from baby_names
order by Total DESC;

-- ajout du windows 

select gender, name, total,
    row_number() over(order by Total DESC) popularite
from baby_names;

-- row_number() --> fonction
-- over(...) popularite --> window/view

select gender, name, total,
    row_number() over(order by Total DESC) popularite,
     rank() over(order by Total DESC) popularite_rank,
      dense_rank() over(order by Total DESC) popularite_Dr
from baby_names;
select * from (
select gender, name, total,
    row_number() over(partition by gender order by Total DESC) popularite
from baby_names) pop
where popularite <= 3;

