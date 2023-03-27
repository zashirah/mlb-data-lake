with pitching_boxscore as (
    select *
    from {{ ref('fct_pitching_boxscore') }}
),

yahoo_players_on_active_roster as (
    select *
    from {{ ref('fct_yahoo_players_on_active_roster') }}
),

yahoo_ps as (
    select *
    from yahoo_players_on_active_roster
    where eligible_positions like '%RP%'
    or eligible_positions like '%SP%'
)

select a.*, b.*

from pitching_boxscore a 
left join yahoo_ps b
on a.player = b.name
