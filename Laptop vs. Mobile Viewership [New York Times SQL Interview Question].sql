SELECT sum(case when device_type = 'laptop' then 1 else 0 end ) as laptop_views
,         sum(case when device_type = 'phone' or device_type = 'tablet' then 1 else 0 end ) as mobile_views
FROM viewership
