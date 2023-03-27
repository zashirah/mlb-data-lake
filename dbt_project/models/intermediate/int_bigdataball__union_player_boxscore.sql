{% set table_list = [
        'stg_bigdataball__mlb_2022_player_boxscore_dataset'
    ] 
%}
with unioned as (
    {% for table in table_list %}
    select 
        *

    from {{ ref(table) }}
    {% if not loop.last -%} union all {%- endif %}
    {% endfor %}
)

select *
from unioned