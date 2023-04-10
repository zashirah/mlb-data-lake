with pd as (
    select *
    from {{ ref('player_dates') }}
),

fpbd as (
    select *
    from {{ ref('fct_pitching_boxscore_daily') }}
),

tot as (
    select *
    from {{ ref('fct_pitching_season_totals') }}
),

dp as (
    select *
    from {{ ref('dim_2023_players') }}
),

{% set fct_cols = ['g', 'gs', 'w', 'l', 'sv', 'h', 'r', 'er', 'bb', 'so', 'hr', 'hbp'] %}

topn as (
    select 
        pd.mlbid::string as mlbid,
        dp.playername as playername,
        pd.date_key as date_key,
        {% for fct_col in fct_cols %}
            SUM(coalesce({{ fct_col }}, 0)) OVER (PARTITION BY pd.mlbid::string ORDER BY pd.date_key) AS cumulative_{{ fct_col }},
        {% endfor %}

    from pd
    left join fpbd
        on pd.mlbid = fpbd.mlbid
        and pd.date_key = fpbd.date_key
    inner join dim_2023_players dp
        on dp.mlbid = pd.mlbid

    order by mlbid
)

select *
from topn