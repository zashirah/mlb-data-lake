# Top 3 (and ties) Teams Batting by Category

## HRs 

```top3hr
    select *
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.hr_total_rank <= 3

    order by playername, date_key
```

```top3hr_tot
    select playername, max(hr_total) as hrs
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.hr_total_rank <= 3
    group by 1
    order by 2 desc
```

<LineChart 
    data={top3hr} 
    x=date_key 
    y=cumulative_hr
    series=playername 
    lineWidth=4
/>
<DataTable data={top3hr_tot}> </DataTable>
