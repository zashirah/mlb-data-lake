import pandas as pd
import yahoo_fantasy_api as yfa
from yahoo_oauth import OAuth2

sc = OAuth2(None, None, from_file='oauth2.json')

if not sc.token_is_valid():
    raise Exception('token not valid')

gm = yfa.Game(sc, 'mlb')

lg = gm.to_league('422.l.63737')

teams = lg.teams()
# print(teams.keys())

dfs = []
for team_key in teams.keys():
    tm = lg.to_team(team_key)
    # print(tm.roster())
    df = pd.DataFrame(tm.roster())
    
    dfs.append(df)

df_out = pd.concat(dfs)

df_out.to_csv('players_on_active_roster.csv')

# print(df_out.columns)
