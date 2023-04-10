
with pitching_stats_daily as (
    select *

    from {{ ref("stg_pybaseball__pitching_stats_daily") }}
)

select *
from pitching_stats_daily