# Top 3 (and ties) Batters by Category

## HRs 

```top3hr
    select *
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.hr_total_rank <= 3

    order by playername, date_key
```

<LineChart 
    data={top3hr} 
    x=date_key 
    y=cumulative_hr
    series=playername 
    lineWidth=4
/>

## Hits 

```top3h
    select *
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.h_total_rank <= 3

    order by playername, date_key
```

<LineChart 
    data={top3h} 
    x=date_key 
    y=cumulative_h
    series=playername 
    lineWidth=4
/>

## SBs 

```top3sb
    select *
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.sb_total_rank <= 3

    order by playername, date_key
```

<LineChart 
    data={top3sb} 
    x=date_key 
    y=cumulative_sb
    series=playername 
    lineWidth=4
/>


## RBIs 

```top3rbi
    select *
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.rbi_total_rank <= 3

    order by playername, date_key
```

<LineChart 
    data={top3rbi} 
    x=date_key 
    y=cumulative_rbi
    series=playername 
    lineWidth=4
/>