select tm, tm_id, games
from {{ ref('stg_pybaseball__standings') }}