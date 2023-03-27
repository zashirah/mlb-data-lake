with players as (
    select *
    from {{ ref('stg_smartfantasybaseball__sfbb_player_id_map') }}
)

select *
from players
