from datetime import date, timedelta
import pandas as pd
from pybaseball import cache
from pybaseball import pitching_stats_range


cache.enable()
# data = pitching_stats_range("2017-05-01", "2017-05-28")

# print(data)
# start_date = date(2022, 4, 8)
# start_date_string = start_date.strftime("%Y-%m-%d")
# end_date = date(2022, 4, 30)
# end_date_string = end_date.strftime("%Y-%m-%d")
# delta = timedelta(days=1)

# data_list = []

# while start_date <= end_date:
    # run_date = start_date.strftime("%Y-%m-%d")
    # print(run_date)
date = "2023-03-31"
data = pitching_stats_range(date)
# data_list.append(data)
# start_date += delta


# out_data = pd.DataFrame()

# out_data = pd.concat(data_list)

data.to_csv(
    f'pitching_stats_range/pitching_stats_range_{date}.csv', 
    index=False
)

# from pybaseball import batting_stats_range

# # retrieve all players' batting stats for the month of May, 2017 
# data = batting_stats_range("2017-05-01", "2017-05-28")
# print(data)

