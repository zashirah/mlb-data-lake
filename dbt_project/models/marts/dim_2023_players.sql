with pitchers as (
    select distinct 
        name,
        mlbid

    from {{ ref('stg_pybaseball__pitching_stats_daily') }}
),

batters as (
    select distinct
        name, 
        mlbid

    from {{ ref('stg_pybaseball__batting_stats_daily') }}    
),

players as (
    select *
    from {{ ref('dim_players') }}
),

unioned as (
    select name, mlbid
    from pitchers
    union
    select name, mlbid
    from batters
),

enriched as (
    select *
    from unioned
    left join players
    on unioned.mlbid = players.mlbid
    where idplayer != 'ohtansh01p'
)

select *
from enriched