with cte as (SELECT user_id , activity_type , sum(time_spent) as time_spent


FROM activities
where activity_type != 'chat'

GROUP BY user_id , activity_type 

)

,

cte3 as (select  c2.user_id , round((select time_spent FROM cte c1 WHERE activity_type = 'open' and c1.user_id = c2.user_id)*100.0/sum(time_spent),2) as Time_spent_opening
, round((select time_spent FROM cte c1 WHERE activity_type = 'send' and c1.user_id = c2.user_id)*100.0/sum(time_spent),2)as time_spent_sending 
from cte c2
GROUP BY c2.user_id

)
select age_bucket , time_spent_sending as send_perc ,  Time_spent_opening as open_perc
from cte3
join age_breakdown a  
on a.user_id = cte3.user_id
ORDER BY cte3.user_id DESC
