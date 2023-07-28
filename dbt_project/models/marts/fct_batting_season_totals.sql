with batting_boxscore as (
    select *
    from {{ ref('fct_batting_boxscore_daily') }}
),

{% set fct_cols = [
    'g', 'pa', 'ab', 'r', 'h', '2b', '3b', 
    'hr', 'rbi', 'bb', 'ibb', 'so', 'hbp', 
    'sh', 'gdp', 'sb', 'cs', 'ba', 'obp', 
    'slg', 'ops'
    ] 
%}

batting_totals as (
    select 
        cast(mlbid as VARCHAR) as mlbid,
        cast(tm as VARCHAR) as team,
        {% for fct_col in fct_cols %}
            sum(coalesce("{{ fct_col }}", 0)) as '{{ fct_col }}_total',
            rank() OVER (ORDER BY sum(coalesce("{{ fct_col }}", 0)) DESC) AS '{{ fct_col }}_total_rank',
        {% endfor %}

    from batting_boxscore

    group by 1, 2
)

select *
from batting_totals
