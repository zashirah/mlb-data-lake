import pandas as pd

cols = [
    'dataset', 'game_id', 'date', 'player_id', 'player', 
    'pos', 'team', 'opponent', 'venue', 'batting.hand', 
    'batting.bo', 'batting.ab', 'batting.r', 'batting.h',
    'batting.rbi', 'batting.bb', 'batting.1b', 'batting.2b',
    'batting.3b', 'batting.hr', 'batting.tb', 'batting.sb',
    'batting.hbp', 'batting.so', 'batting.pa', 'batting.p#',
    'batting.s#', 'batting.po', 'batting.a', 'batting.avg',
    'pitching.hand', 'pitching.starting_pitcher', 'pitching.ip',
    'pitching.h', 'pitching.r', 'pitching.er', 'pitching.era',
    'pitching.p#', 'pitching.s#', 'pitching.bb', 'pitching.so',
    'pitching.w', 'pitching.l', 'pitching.sv', 'pitching.hr',
    'pitching.qs', 'pitching.hb', 'pitching.cg', 'pitching.cg_sho',
    'pitching.nh', 'pitching.bf', 'pitching.gb', 'pitching.fb',
    'pitching.ld'
]

df = pd.read_excel('MLB-2022-Player-BoxScore-Dataset.xlsx', skiprows=1)

df.columns = cols

print(df)

df.to_csv('mlb_2022_player_boxscore_dataset.csv', index=False)
