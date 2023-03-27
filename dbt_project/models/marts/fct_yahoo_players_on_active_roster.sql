with players_on_active_roster as (
    select 
        "player_id", 
        "name", 
        "status", 
        "position_type", 
        "eligible_positions",
        "selected_position"

    from {{ ref("stg_yahoofantasybaseball__players_on_active_roster") }}
)

select *
from players_on_active_roster