with player_boxscore as (
    select *
    from {{ ref("int_bigdataball__union_player_boxscore") }}
),

pitching_boxscore as (
    select 
        "dataset", 
        "game_id", 
        "date", 
        "player_id", 
        "player", 
        "pos", 
        "team", 
        "opponent", 
        "venue", -- not in daily file
        -- "pitching.hand", -- should move to dim table
        "pitching.starting_pitcher", 
        "pitching.ip",
        "pitching.ip_whole",
        "pitching.ip_decimal",
        {#
        "pitching.ip_decimal_updated",
        "pitching.ip_math",
        #}
        "pitching.h", 
        "pitching.r", 
        "pitching.er", 
        "pitching.era",
        "pitching.p#", 
        "pitching.s#", 
        "pitching.bb", 
        "pitching.so",
        "pitching.w", 
        "pitching.l", 
        "pitching.sv", 
        "pitching.hr",
        "pitching.qs", 
        "pitching.hb", 
        "pitching.cg", 
        "pitching.cg_sho",
        "pitching.nh", 
        "pitching.bf", 
        "pitching.gb", 
        "pitching.fb",
        "pitching.ld"

    from player_boxscore
    where "pitching.ip" is not null
)

select *
from pitching_boxscore