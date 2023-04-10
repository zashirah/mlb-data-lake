with source as (
    select *

        from {{ source("smartfantasybaseball", "sfbb_player_id_map")}}
    )

select *
from source
