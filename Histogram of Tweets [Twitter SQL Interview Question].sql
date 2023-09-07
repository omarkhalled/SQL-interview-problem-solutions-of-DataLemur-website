with cte as (SELECT count(tweet_id) as tweetsPerUser , user_id
FROM tweets
WHERE tweet_date BETWEEN '2022-01-01' 
  AND '2022-12-31'
  
GROUP BY user_id
)
select tweetsPerUser as tweet_bucket ,count(user_id) as users_num
from cte
GROUP BY tweetsPerUser
