with source as (
    select *

        from {{ source("pybaseball", "batting_stats_daily")}}
    )

select *
from source
