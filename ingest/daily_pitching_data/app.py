from awswrangler import s3 as aws3
import boto3
from datetime import date, timedelta
import os
from pybaseball import pitching_stats_range


def main():
    today = date.today()
    delta = timedelta(days=1)
    run_date = today - delta
    run_date_string = run_date.strftime("%Y-%m-%d")
    print("Run date:", run_date_string)

    data = pitching_stats_range(run_date_string)
    # data.to_csv(
    #     f's3://zs-mlb-datalake/pybaseball/pitching_stat_range/pitching_stat_range_{run_date_string}.csv',
    #     index=False
    # )

    ACCESS_KEY = os.environ.get('AWS_ACCESS_KEY')
    SECRET_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY')

    s3_session = boto3.session.Session(
        aws_access_key_id=ACCESS_KEY,
        aws_secret_access_key=SECRET_KEY,
    )

    aws3.to_csv(
        df=data,
        path=f's3://zs-mlb-datalake/pybaseball/pitching_stat_range/pitching_stat_range_{run_date_string}.csv',
        index=False,
        boto3_session=s3_session
    )


main()