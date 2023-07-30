# Top 3 (and ties) Pitchers by Category

## Strikeouts

```top3so
    select *
    from top_n_pitchers topn
    inner join fct_pitching_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.so_total_rank <= 3

    order by playername, date_key

```

```top3sotot
    select *
    from fct_pitching_season_totals topn
    inner join dim_2023_players dp
        on topn.mlbid = dp.mlbid
    where so_total_rank <= 3
```

<LineChart
    data={top3so}
    x=date_key
    y=cumulative_so
    series=playername
    lineWidth=4
/>


