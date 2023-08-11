# Top 3 (and ties) Batters by Category

This data was provided by [baseball-reference](https://www.baseball-reference.com/) via [pybaseball](https://github.com/jldbc/pybaseball).

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

## Hits 

```top3h
    select *
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.h_total_rank <= 3

    order by playername, date_key
```

```top3h_tot
    select playername, max(h_total) as hits
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.h_total_rank <= 3
    group by 1
    order by 2 desc
```

<LineChart 
    data={top3h} 
    x=date_key 
    y=cumulative_h
    series=playername 
    lineWidth=4
/>
<DataTable data={top3h_tot}> </DataTable>

## SBs 

```top3sb
    select *
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.sb_total_rank <= 3

    order by playername, date_key
```

```top3sb_tot
    select playername, max(sb_total) as sbs
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.sb_total_rank <= 3
    group by 1
    order by 2 desc
```

<LineChart 
    data={top3sb} 
    x=date_key 
    y=cumulative_sb
    series=playername 
    lineWidth=4
/>
<DataTable data={top3sb_tot}> </DataTable>


## RBIs 

```top3rbi
    select *
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.rbi_total_rank <= 3

    order by playername, date_key
```

```top3rbi_tot
    select playername, max(rbi_total) as rbis
    from top_n_batters topn
    inner join fct_batting_season_totals tot
        on topn.mlbid = tot.mlbid
        and tot.rbi_total_rank <= 3
    group by 1
    order by 2 desc
```

<LineChart 
    data={top3rbi} 
    x=date_key 
    y=cumulative_rbi
    series=playername 
    lineWidth=4
/>
<DataTable data={top3rbi_tot}> </DataTable>