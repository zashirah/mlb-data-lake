with source as (
    select 
        "player_id", 
        "name", 
        "position_type", 
        "eligible_positions",
        "percent_owned",
        "status"

        from {{ source("yahoofantasybaseball", "free_agents_rp")}}
    )

select *
from source
