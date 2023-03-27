import pandas as pd
import yahoo_fantasy_api as yfa
from yahoo_oauth import OAuth2

sc = OAuth2(None, None, from_file='oauth2.json')

if not sc.token_is_valid():
    raise Exception('token not valid')

gm = yfa.Game(sc, 'mlb')

lg = gm.to_league('422.l.63737')

fa_RPs = lg.free_agents('RP')

print(fa_RPs)