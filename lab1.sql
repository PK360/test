--ex. 1
select
    tc.title_id, count(tc.copy_id)
from title_copy tc
where trim(lower(tc.status)) = 'available'
group by tc.title_id


-- ex. 2
select
    (m.last_name || ' ' || m.first_name)
from member m


-- ex. 3
select

from rental rr
    join (
        select category from (
            select t.category, count(t.*) as nr_sales
            from title t
            join rental r on r.title_id = t.title_id
            group by t.category
            order by nr_sales desc
        )
        where rownum = 1
    )
