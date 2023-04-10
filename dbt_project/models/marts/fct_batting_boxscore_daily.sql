with batting_stats_daily as (
    select *

    from {{ ref("stg_pybaseball__batting_stats_daily") }}
)

select *
from batting_stats_daily