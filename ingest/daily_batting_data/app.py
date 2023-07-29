from awswrangler import s3 as aws3
import boto3
from datetime import date, timedelta
import os
from pybaseball import batting_stats_range


def main():
    days = os.environ.get('days_ago')

    if not days:
        days = 1
    else:
        days = int(days)

    today = date.today()
    delta = timedelta(days)
    run_date = today - delta
    run_date_string = run_date.strftime("%Y-%m-%d")
    print("today:", today.strftime("%Y-%m-%d"))
    print("Run date:", run_date_string)

    data = batting_stats_range(run_date_string)

    print(data)

    ACCESS_KEY = os.environ.get('AWS_ACCESS_KEY')
    SECRET_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY')

    s3_session = boto3.session.Session(
        aws_access_key_id=ACCESS_KEY,
        aws_secret_access_key=SECRET_KEY,
    )

    aws3.to_csv(
        df=data,
        path=f's3://zs-mlb-datalake/data/raw/pybaseball/batting_stats_range/batting_stats_range_{run_date_string}.csv',
        index=False,
        boto3_session=s3_session
    )

    print('Data landed in s3')


main()