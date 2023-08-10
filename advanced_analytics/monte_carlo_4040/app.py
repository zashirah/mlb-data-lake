import duckdb
import numpy as np
import os
import pandas as pd


def main():
    MOTHERDUCK_TOKEN = os.environ['DBT_MOTHERDUCK_TOKEN']
    database = "mlb"
    con = duckdb.connect(f'md:{database}?motherduck_token={MOTHERDUCK_TOKEN}')

    fct_batting_season_totals = con.sql(f"""
        select  
            tot.*,
            players.name,
            games.games as team_g_total

        from {database}.main.fct_batting_season_totals tot
        inner join {database}.main.dim_2023_players players
        on tot.mlbid = players.mlbid
        
        inner join {database}.main.team_games games
        on games.tm_id = players.team
        
        where players.active = 'Y'
    """).df()

    def run_monte_carlo_sim_event(stat_per_ab, expected_pa, stat_count):
        stat = stat_count.copy()
        stat_tracker = []
        for n in range(int(expected_pa)):
            rand = np.random.random()
            if rand <= stat_per_ab:
                stat += 1
            stat_tracker.append(stat)

        return stat, stat_tracker

    def iterate(iterations, expected_pa, stat_per_ab, stat_count):
        stat_list = []
        stat_tracker_list = []
        for n in range(iterations):
            stat, stat_tracker = run_monte_carlo_sim_event(stat_per_ab, expected_pa, stat_count)
            stat_list.append(stat)
            stat_tracker_list.append(stat_tracker)
        
        return stat_list, stat_tracker_list

        
    def simulate_season(df):
        # loop over 4040 stats
        ronald_stat_array = {}
        ronald_stat_tracker_list = {}
        for stat in ['hr', 'sb']:
            stat_prob_array = []
            # loop over dataset
            for i in range(len(df)):
                # set/calc vars
                total_games = 162
                total_games_played = df.iloc[i]['g_total']
                stat_count_goal = 40
                stat_count = df.iloc[i][f'{stat}_total']
                stat_count_needed = stat_count_goal - stat_count
                pa = df.iloc[i]['pa_total']
                avg_pa = pa / total_games_played
                # NEED TO RECALCULATE THIS FIELD. TOTAL GAMES PLAYED IS BASED ON IND. GAMES, NOT TEAM GAMES
                expected_pa = avg_pa * (total_games - total_games_played)
                stat_per_ab = stat_count / pa
                iterations = 100
                
                # iterate over monte carlo sim
                stat_list, stat_tracker_list = iterate(iterations, expected_pa, stat_per_ab, stat_count)
                # convert list to array
                stat_array = np.array(stat_list)
                # filter array based on stat count needed
                filter_arr = stat_array >= stat_count_goal
                # append stat probability to list
                stat_prob_array.append(sum(filter_arr)/iterations)
                if df.iloc[i]['mlbid'] == '660670':
                    ronald_stat_array[stat] = stat_array.copy()
                    ronald_stat_tracker_list[stat] = stat_tracker_list.copy()
            
            # add col for stat count
            df[f'40{stat}prob'] = stat_prob_array
        
        # calculate prob of reaching 40 hr and 40 sb
        df['4040prob'] = df[f'40hrprob'] * df[f'40sbprob']
                
        return df, ronald_stat_array, ronald_stat_tracker_list

    def create_monte_carlo_4040(df):
        con.sql(f"""
            create or replace table {database}.main.monte_carlo_4040 as
                select *, row_number() over() as row_number from df
        """)

    def create_acuna_hr_sim_results(stat_tracker_list):
        for stat in stat_tracker_list:
            
            i = 0
            sim_df = pd.DataFrame()
            for stat_tracker in stat_tracker_list[stat]:
                i += 1
                sim_df[f'sim{i}'] = stat_tracker
            
            con.sql(f"create or replace table {database}.main.acuna_{stat}_sim_results as select *, row_number() over() as row_number from sim_df")

    def create_acuna_hr_sim_results_final(stat_array):
        for stat in stat_array:
            sim_results_final = pd.DataFrame(stat_array[stat], columns=['Sim Results'])
            con.sql(f'create or replace table {database}.main.acuna_{stat}_sim_results_final as select * from sim_results_final')


    df, ronald_stat_array, ronald_stat_tracker_list = simulate_season(fct_batting_season_totals)
    create_monte_carlo_4040(df)
    create_acuna_hr_sim_results(ronald_stat_tracker_list)
    create_acuna_hr_sim_results_final(ronald_stat_array)


main()