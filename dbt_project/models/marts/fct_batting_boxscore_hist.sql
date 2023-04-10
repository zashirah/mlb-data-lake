with player_boxscore as (
    select *
    from {{ ref("int_bigdataball__union_player_boxscore") }}
),

batting_boxscore as (
    select 
        "dataset", 
        "game_id", 
        "date", 
        "player_id", 
        "player", 
        "pos", 
        "team", 
        "opponent", 
        "venue", 
        "batting.hand", 
        "batting.bo", 
        "batting.ab", 
        "batting.r", 
        "batting.h",
        "batting.rbi", 
        "batting.bb", 
        "batting.1b", 
        "batting.2b",
        "batting.3b", 
        "batting.hr", 
        "batting.tb", 
        "batting.sb",
        "batting.hbp", 
        "batting.so", 
        "batting.pa", 
        "batting.p#",
        "batting.s#", 
        "batting.po", 
        "batting.a", 
        "batting.avg"

    from player_boxscore
)

select *
from batting_boxscore