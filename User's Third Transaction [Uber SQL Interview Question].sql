with cte as 
(select user_id ,	spend	, transaction_date ,lead(transaction_date,2) over(PARTITION BY user_id ORDER BY transaction_date )
from transactions
where user_id in (

SELECT user_id
FROM transactions
GROUP BY user_id
having count(transaction_date) >=3
)
order by user_id , transaction_date
)
select transactions.user_id , transactions.spend , transactions.transaction_date
from transactions
join cte on cte.lead = transactions.transaction_date

/*



SELECT 
  user_id, 
  spend, 
  transaction_date
FROM (
  SELECT 
  user_id, 
  spend, 
  transaction_date, 
  ROW_NUMBER() OVER (
    PARTITION BY user_id ORDER BY transaction_date) AS row_num
FROM transactions;
) AS trans_num 
WHERE row_num = 3;
*/
