with pitching_boxscore as (
    select *
    from {{ ref('fct_pitching_boxscore_daily') }}
),

{% set fct_cols = ['g', 'gs', 'w', 'l', 'sv', 'h', 'r', 'er', 'bb', 'so', 'hr', 'hbp'] %}

pitching_totals as (
    select 
        cast(mlbid as VARCHAR) as mlbid,
        {% for fct_col in fct_cols %}
            sum(coalesce({{ fct_col }}, 0)) as {{ fct_col }}_total,
            dense_rank() OVER (ORDER BY sum(coalesce({{ fct_col }}, 0)) DESC) AS {{ fct_col }}_total_rank,
        {% endfor %}

    from pitching_boxscore

    group by 1
)

select *
from pitching_totals
