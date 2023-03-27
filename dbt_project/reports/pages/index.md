# pitchers


```pitcher_boxscore
select 
	player,
    player_id,
    team,
	sum(case when "pitching.starting_pitcher" = 'YES' then 1 else 0 end) as starts,
    count(*) as outings,
    sum("pitching.ip_math") as innings_pitched,
    max("date") as most_recent_outing


from fct_pitching_boxscore

where player = 'Spencer Strider'

group by 1,2,3
```


```rostered_players
select name, count(*)
from fct_yahoo_players_on_active_roster
where eligible_positions like '%RP%'
or eligible_positions like '%SP%'
group by 1
order by 1
```

```both
select player, count(*)
from available_relievers
where position_type is not null
group by 1
order by 1
```

```no_join
select *
from ${rostered_players} a
left join ${both} b
on a.name = b.player
where b.player is null
```

```people_dim
select *
from dim_players
```