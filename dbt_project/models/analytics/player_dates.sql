with dates as (
    select *
    from {{ ref('dim_2023_season_dates') }}
),

players as (
    select *
    from {{ ref('dim_2023_players') }}   
),

player_dates as (
    select dates.date_key, players.mlbid

    from dates
    cross join players
    where dates.date_key < current_date
)

select *
from player_dates