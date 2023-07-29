with source as (
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
        "batting.avg",
        "pitching.hand", 
        "pitching.starting_pitcher", 
        "pitching.ip",
        split_part("pitching.ip", '.', 1) as 'pitching.ip_whole',
        split_part("pitching.ip", '.', 2) as 'pitching.ip_decimal',
        {# 
        case 
            when split_part("pitching.ip", '.', 2) = '0' then 0 
            when split_part("pitching.ip", '.', 2) = '1' then 0.333333333333 
            when split_part("pitching.ip", '.', 2) = '2' then 0.666666666666
        end as 'pitching.ip_decimal_updated',
        split_part("pitching.ip", '.', 1)::INT + case 
            when split_part("pitching.ip", '.', 2) = '0' then 0 
            when split_part("pitching.ip", '.', 2) = '1' then 0.333333333333 
            when split_part("pitching.ip", '.', 2) = '2' then 0.666666666666
        end as 'pitching.ip_math', 
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

        from {{ source('bigdataball', 'mlb_2022_player_boxscore_dataset')}}
    )

select *
from source
