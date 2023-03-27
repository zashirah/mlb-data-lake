with source as (
    select 
        "player_id", 
        "name", 
        "status", 
        "position_type", 
        "eligible_positions",
        "selected_position"

        from {{ source("yahoofantasybaseball", "players_on_active_roster")}}
    )

select *
from source