with source as (
      select * from {{ source('pybaseball', 'standings') }}
)
select *, 
case 
    when tm = 'Arizona Diamondbacks' then 'ARI' 
    when tm = 'Atlanta Braves' then 'ATL' 
    when tm = 'Baltimore Orioles' then 'BAL' 
    when tm = 'Boston Red Sox' then 'BOX' 
    when tm = 'Chicago Cubs' then 'CHC' 
    when tm = 'Chicago White Sox' then 'CHW' 
    when tm = 'Cincinnati Reds' then 'CIN' 
    when tm = 'Cleveland Guardians' then 'CLE' 
    when tm = 'Colorado Rockies' then 'COL' 
    when tm = 'Detroit Tigers' then 'DET' 
    when tm = 'Houston Astros' then 'HOU' 
    when tm = 'Kansas City Royals' then 'KC' 
    when tm = 'Los Angeles Angels' then 'LAA' 
    when tm = 'Los Angeles Dodgers' then 'LAD' 
    when tm = 'Miami Marlins' then 'MIA' 
    when tm = 'Milwaukee Brewers' then 'MIL' 
    when tm = 'Minnesota Twins' then 'MIN' 
    when tm = 'New York Mets' then 'NYM' 
    when tm = 'New York Yankees' then 'NYY' 
    when tm = 'Oakland Athletics' then 'OAK' 
    when tm = 'Philadelphia Phillies' then 'PHI' 
    when tm = 'Pittsburgh Pirates' then 'PIT' 
    when tm = 'San Diego Padres' then 'SD' 
    when tm = 'San Francisco Giants' then 'SF' 
    when tm = 'Seattle Mariners' then 'SEA' 
    when tm = 'St. Louis Cardinals' then 'STL' 
    when tm = 'Tampa Bay Rays' then 'TB' 
    when tm = 'Texas Rangers' then 'TEX' 
    when tm = 'Toronto Blue Jays' then 'TOR' 
    when tm = 'Washington Nationals' then 'WAS' 
end as tm_id,
w + l as games

 from source
  