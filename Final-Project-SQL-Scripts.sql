#Query 1:
# Identify average customer visit in the type B store in April Months
select sum(sd1.weekly_sales)/fd1.cpi  as avg_cust_visit from sample.sales_data sd1 inner join sample.feature_data fd1 on sd1.store=fd1.store
inner join sample.store_data std1 on fd1.store=std1.store where std1.type1='B' and Month(fd1.date1)=04;

#Query 2:
# Best sales in holiday week for all store types
select max(sald1.weekly_sales) as best_sales,sald1.store from sample.sales_data sald1  inner join sample.store_data sd1 on sald1.store=sd1.store 
where sald1.isholiday=1
group by sald1.store;

#Query 3:
# Store with worst sales in leap year
select min(sd1.weekly_sales) as worst_sales,sd1.store from sample.sales_data sd1 left join sample.feature_data sfd1 on sfd1.store=sd1.store where ((sfd1.date1%4=1 or sfd1.date1%400=1) and sfd1.date1%100!=1);

#Query 4:
# What is the expected sales of each department when unemployment factor is greater >8

select (sum(sd1.weekly_sales)+sum(fd1.markdown1)+sum(fd1.markdown2)+sum(fd1.markdown3)+sum(fd1.markdown4)+sum(fd1.markdown5)) as exp_sales from sample.sales_data sd1 inner join  sample.feature_data fd1 on sd1.store=fd1.store where fd1.unemployment>8;



# Query 5:
#Total sales of each department month wise
select  sum(weekly_sales) as total_sales_of_dept,dept  from sample.sales_data sd group by sd.dept;

# Query 6
#store with high sales in week wise
select max(weekly_sales) as high_sales,store from sample.sales_data group by store;

#Query 7
#better dept based  performance on the store on all the week

select store,dept,max(weekly_sales) from sample.sales_data group by dept;

#Query 8
#Identify the store which has minimum fuel price based on the week

select store, date1,min(fuel_price) as min_fuel_price from sample.feature_data group by date1;

#Query 9
#overall performance of the store based on year wise

select sd1.store,sum(sd1.weekly_sales) as performance from sample.sales_data sd1 inner join sample.feature_data fd1 on sd1.store=fd1.store group by sd1.date1;

# Query 10
#Find performance of the store where there are no offers
select sd1.store,sum(sd1.weekly_sales) as performance from sample.sales_data sd1 inner join sample.feature_data fd1 on sd1.store=fd1.store where fd1.markdown1 is NULL and fd1.markdown2 is Null and fd1.markdown3 is Null and fd1.markdown4 is null and fd1.markdown5 is Null;