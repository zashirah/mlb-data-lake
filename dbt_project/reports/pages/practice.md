<!-- # pitchers

 
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

```yahoo_player


```yahoo_players_not_in_dim
    select fct_yahoo_players_on_active_roster.*

    from dim_players
  
    right join fct_yahoo_players_on_active_roster
    on dim_players.yahooid = fct_yahoo_players_on_active_roster.player_id

    where dim_players.yahooid is null
```

```pybaseball_players_not_in_dim
    select fct_pitching_stats_daily.*

    from dim_players
  
    right join fct_pitching_stats_daily
    on dim_players.mlbid = fct_pitching_stats_daily.mlbid

    where dim_players.yahooid is null
```

* Need to update the date format for Date

```daily_pitching_data
    select name, date > current_date - 1, current_date, current_date - 1 
    from stg_pybaseball__pitching_stats_daily
```

```daily_pitching_data2
    select name, sum(g) as appearances, sum(gs) as starts, sum(case when date > current_date - 1 then g else 0 end) as starts_last_2_days
    from stg_pybaseball__pitching_stats_daily
    group by 1
    order by 4 desc
```


<!-- <details>
    <summary>Click me</summary>
  
    <DataTable data={daily_pitching_data}></DataTable>

</details> -->
