from awswrangler import s3 as aws3
import boto3
from datetime import date, timedelta
import os
import pandas as pd
import yahoo_fantasy_api as yfa
from yahoo_oauth import OAuth2

def main():
    today = date.today()
    run_date_string = today.strftime("%Y-%m-%d")

    ACCESS_KEY = os.environ.get('AWS_ACCESS_KEY')
    SECRET_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY')

    s3_session = boto3.session.Session(
        aws_access_key_id=ACCESS_KEY,
        aws_secret_access_key=SECRET_KEY,
    )

    s3_client = boto3.client(
        's3',
        aws_access_key_id=ACCESS_KEY,
        aws_secret_access_key=SECRET_KEY,
    )


    with open('oauth2.json', 'wb') as data:
        s3_client.download_fileobj('zs-mlb-datalake', 'data/raw/yahoofantasybaseball/oauth2.json', data)
    
    sc = OAuth2(None, None, from_file='oauth2.json')

    if not sc.token_is_valid():
        raise Exception('token not valid')

    gm = yfa.Game(sc, 'mlb')

    lg = gm.to_league('422.l.63737')

    teams = lg.teams()

    dfs = []
    for team_key in teams.keys():
        tm = lg.to_team(team_key)
        df = pd.DataFrame(tm.roster())
        
        dfs.append(df)

    df_out = pd.concat(dfs)

    aws3.to_csv(
        df=df_out,
        path=f's3://zs-mlb-datalake/data/raw/yahoofantasybaseball/rostered/rostered_rp_{run_date_string}.csv',
        index=False,
        boto3_session=s3_session
    )


main()



