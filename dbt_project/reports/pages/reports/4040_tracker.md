# Ronald Acuña - 4040 Tracker and Monte Carlo Simulation

```top_player
    select mlbid, "4040prob", "40hrprob", "40sbprob", "g_total"
    from monte_carlo_4040 tot
    where tot.g_total > 100
    and tot."4040prob" >= 0.01
    order by "4040prob" desc
    limit 1
```

```acuna_4040
with cumulative_data as (
    select distinct playername, cumulative_hr as "Home Runs", cumulative_sb as "Stolen Bases", cumulative_g as "Games"
    from top_n_batters topn
    inner join ${top_player} tot
        on topn.mlbid = tot.mlbid
)

select *
from cumulative_data
order by "Games" desc
```

## Description

Show the season long 40HR/40SB trend for Ronald Acuña. Based on a basic Monte Carlo Simulation, Acuña has a <b><Value 
    data={top_player}
    column="4040prob"
    fmt=pct0
/></b> chance of achieving 40 Home Runs and 40 Stolen Bases. (<b><Value 
    data={top_player}
    column="40hrprob"
    fmt=pct0
/></b> HR chance & <b><Value 
    data={top_player}
    column="40sbprob"
    fmt=pct0
/></b> SB chance). 

The Monte Carlo Simulation is based on the HR and SB rates. If the HR rate is 5%, that means 5% of plate appearances end in Home Runs. We then take the average number of PA's / game and extrapolate that for the rest of the games this season. For each expected at bat, we calculate a random number. If that random number is less than the expected HR rate, then we count that as a home run. 

This data was provided by [baseball-reference](https://www.baseball-reference.com/) via [pybaseball](https://github.com/jldbc/pybaseball).

***

<LineChart 
    title="Current 4040 results"
    data={acuna_4040} 
    x=Games 
    y={["Home Runs", "Stolen Bases"]}
    lineWidth=4
    xAxisTitle="Games"
>
    <ReferenceLine 
        y=40
        label="GOAL"
    />
    <ReferenceLine 
        data={top_player}
        x="g_total"
        label="GAMES"
    />
</LineChart>

*** 

```acuna_hr_sim_results
select *
from mlb.main.acuna_hr_sim_results
```
<LineChart 
    title="Home Run Simulation Results"
    data={acuna_hr_sim_results} 
    x=row_number
    y={['sim1',
        'sim2',
        'sim3',
        'sim4',
        'sim5',
        'sim6',
        'sim7',
        'sim8',
        'sim9',
        'sim10',
        'sim11',
        'sim12',
        'sim13',
        'sim14',
        'sim15',
        'sim16',
        'sim17',
        'sim18',
        'sim19',
        'sim20',
        'sim21',
        'sim22',
        'sim23',
        'sim24',
        'sim25',
        'sim26',
        'sim27',
        'sim28',
        'sim29',
        'sim30',
        'sim31',
        'sim32',
        'sim33',
        'sim34',
        'sim35',
        'sim36',
        'sim37',
        'sim38',
        'sim39',
        'sim40',
        'sim41',
        'sim42',
        'sim43',
        'sim44',
        'sim45',
        'sim46',
        'sim47',
        'sim48',
        'sim49',
        'sim50',
        'sim51',
        'sim52',
        'sim53',
        'sim54',
        'sim55',
        'sim56',
        'sim57',
        'sim58',
        'sim59',
        'sim60',
        'sim61',
        'sim62',
        'sim63',
        'sim64',
        'sim65',
        'sim66',
        'sim67',
        'sim68',
        'sim69',
        'sim70',
        'sim71',
        'sim72',
        'sim73',
        'sim74',
        'sim75',
        'sim76',
        'sim77',
        'sim78',
        'sim79',
        'sim80',
        'sim81',
        'sim82',
        'sim83',
        'sim84',
        'sim85',
        'sim86',
        'sim87',
        'sim88',
        'sim89',
        'sim90',
        'sim91',
        'sim92',
        'sim93',
        'sim94',
        'sim95',
        'sim96',
        'sim97',
        'sim98',
        'sim99',
        'sim100']}
    lineWidth=2
    yMin=20
    chartAreaHeight=500
    legend=False
    yAxisTitle="Home Runs" 
    xAxisTitle="Plate Appearances"
>
    <ReferenceLine 
        y=40
        label="GOAL"
    />
</LineChart>

```acuna_hr_sim_results_final
select *
from mlb.main.acuna_hr_sim_results_final
```

<Histogram 
    title="Home Run Simulation Results Distribution"
    data={acuna_hr_sim_results_final} 
    x="Sim Results"
>
</Histogram>

```acuna_sb_sim_results
select *
from mlb.main.acuna_sb_sim_results
```

*** 

<LineChart 
    title="Stolen Bases Simulation Results"
    data={acuna_sb_sim_results} 
    x=row_number
    y={['sim1',
        'sim2',
        'sim3',
        'sim4',
        'sim5',
        'sim6',
        'sim7',
        'sim8',
        'sim9',
        'sim10',
        'sim11',
        'sim12',
        'sim13',
        'sim14',
        'sim15',
        'sim16',
        'sim17',
        'sim18',
        'sim19',
        'sim20',
        'sim21',
        'sim22',
        'sim23',
        'sim24',
        'sim25',
        'sim26',
        'sim27',
        'sim28',
        'sim29',
        'sim30',
        'sim31',
        'sim32',
        'sim33',
        'sim34',
        'sim35',
        'sim36',
        'sim37',
        'sim38',
        'sim39',
        'sim40',
        'sim41',
        'sim42',
        'sim43',
        'sim44',
        'sim45',
        'sim46',
        'sim47',
        'sim48',
        'sim49',
        'sim50',
        'sim51',
        'sim52',
        'sim53',
        'sim54',
        'sim55',
        'sim56',
        'sim57',
        'sim58',
        'sim59',
        'sim60',
        'sim61',
        'sim62',
        'sim63',
        'sim64',
        'sim65',
        'sim66',
        'sim67',
        'sim68',
        'sim69',
        'sim70',
        'sim71',
        'sim72',
        'sim73',
        'sim74',
        'sim75',
        'sim76',
        'sim77',
        'sim78',
        'sim79',
        'sim80',
        'sim81',
        'sim82',
        'sim83',
        'sim84',
        'sim85',
        'sim86',
        'sim87',
        'sim88',
        'sim89',
        'sim90',
        'sim91',
        'sim92',
        'sim93',
        'sim94',
        'sim95',
        'sim96',
        'sim97',
        'sim98',
        'sim99',
        'sim100']}
    lineWidth=2
    yMin=35
    chartAreaHeight=500
    legend=False
    yAxisTitle="Stolen Bases" 
    xAxisTitle="Plate Appearances"
>
    <ReferenceLine 
        y=40
        label="GOAL"
    />
</LineChart>

```acuna_sb_sim_results_final
select *
from mlb.main.acuna_sb_sim_results_final
```
<Histogram 
    title="Stolen Bases Simulation Results Distribution"
    data={acuna_sb_sim_results_final} 
    x="Sim Results"
>
</Histogram>
