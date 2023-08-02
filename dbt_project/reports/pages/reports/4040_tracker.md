# 40 SB & 40 HR Tracker

### Description

Show the season long 40HR/40SB trend for the players with the top 5 odds of achieving 4040. Currently just showing Acuna and Corbin Carrol. Need to do some math to calculate the top 5 odds. 


```acuna_4040
    select playername, date_key, cumulative_hr as stat, 'Home Runs' as stat_type
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and topn.mlbid = 660670

    union

    select playername, date_key, cumulative_sb as stat, 'Stolen Bases' as stat_type
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and topn.mlbid = 660670
```

<LineChart 
    title='Acuna'
    data={acuna_4040} 
    x=date_key 
    y=stat
    series=stat_type 
    lineWidth=4
/>

```carroll_4040
    select playername, date_key, cumulative_hr as stat, 'Home Runs' as stat_type
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and topn.mlbid = 682998

    union

    select playername, date_key, cumulative_sb as stat, 'Stolen Bases' as stat_type
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and topn.mlbid = 682998
```

<LineChart 
    title='Corbin Carroll'
    data={carroll_4040} 
    x=date_key 
    y=stat
    series=stat_type 
    lineWidth=4
/>