--data of table 1

select * from dbo.data1


--data of table 1

select * from dbo.Data2



--total no of rows in data 1

select COUNT(*) from Data1



--total no of rows in data 2

select COUNT(*) from Data2



--data of delhi and westbengal

select * from Data2 where State in ('Delhi','West Bengal')



--total population combining all states

select sum(population) as population from Data1



--avg  growth rate in percentage

select avg(growth)*100 growthrate from data1



--avg growth rate by state in percentage

select state,avg(growth)*100growthrate from data1 group by State




--sexration by state

select state,round(avg(Sex_Ratio),0) avg_sex_ratio from data1
group by State order by  avg_sex_ratio desc;



--avg litracy rate

select state,round(avg(Literacy),0) avg_litracy from data1
group by State order by  avg_litracy desc;




--litracy rate of states above 90%

select state,round(avg(Literacy),0) avg_litracy from data1 group by State having round(avg(Literacy),0)>90
order by avg_litracy desc;



--avg growth rate of top 3 states

select top 3 state, avg(growth)*100 avg_growth_rate from data1 group by State order by 
avg_growth_rate desc




--avg growth rate of bottom 3 states

select bottom 3 state, avg(growth)*100 avg_growth_rate from data1
group by State order by avg_growth_rate asc




---top & bottom 3 states in litracy rate


drop table if exists #topstates
create table #topstates
( state nvarchar(255),
 topstates float

)
insert into #topstates
select state, round(avg(Literacy),0) avg_litracy_ratio from data1 
group by State order by avg_litracy_ratio desc

select top 3 * from #topstates order by #topstates.state desc;


---------------------------------------------

drop table if exists #bottomstates
create table #bottomstates
( state nvarchar(255),
 bottomstates float

)
insert into #bottomstates
select state, round(avg(Literacy),0) avg_litracy_ratio from data1 
group by State order by avg_litracy_ratio desc

select top 3 * from #bottomstates order by #bottomstates.state asc;

-------------
---union operator

select * from (
select top 3 * from #topstates order by #topstates.state desc) a
union
select * from (
select top 3 * from #bottomstates order by #bottomstates.state asc) b




--states starting with letter d

select distinct state from Data1 where lower(state) like 'd%'




