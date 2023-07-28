with pd as (
    select *
    from {{ ref('player_dates') }}
),

fbbd as (
    select *
    from {{ ref('fct_batting_boxscore_daily') }}
),

tot as (
    select *
    from {{ ref('fct_batting_season_totals') }}
),

dp as (
    select *
    from {{ ref('dim_2023_players') }}
),

{% set fct_cols = [
    'g', 'pa', 'ab', 'r', 'h', '2b', '3b', 
    'hr', 'rbi', 'bb', 'ibb', 'so', 'hbp', 
    'sh', 'gdp', 'sb', 'cs', 'ba', 'obp', 
    'slg', 'ops'
    ] 
%}

topn as (
    select 
        pd.mlbid::string as mlbid,
        dp.playername as playername,
        pd.date_key as date_key,
        {% for fct_col in fct_cols %}
            SUM(coalesce("{{ fct_col }}", 0)) OVER (PARTITION BY pd.mlbid::string ORDER BY pd.date_key) AS 'cumulative_{{ fct_col }}',
        {% endfor %}

    from pd
    left join fbbd
        on pd.mlbid = fbbd.mlbid
        and pd.date_key = fbbd.date_key
    inner join dim_2023_players dp
        on dp.mlbid = pd.mlbid

    order by mlbid
)

select *
from topn