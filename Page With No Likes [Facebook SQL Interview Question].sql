SELECT page_id
FROM pages
where page_id not IN (select page_id from page_likes)
