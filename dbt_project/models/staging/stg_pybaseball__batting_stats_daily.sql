with source as (
    select distinct *, 
            strptime(date, '%b %d, %Y') as date_key

        from {{ source("pybaseball", "batting_stats_daily")}}
    )

select *
from source
