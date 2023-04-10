with free_agents_rp as (
    select 
        "player_id", 
        "name", 
        "position_type", 
        "eligible_positions",
        "percent_owned",
        "status"

    from {{ ref("stg_yahoofantasybaseball__free_agents_rp") }}
)

select *
from free_agents_rp