dbt run
rm -rf ~/code/projects/mlb-data-lake/dbt_project/reports/duckdb.db
cp ~/code/projects/mlb-data-lake/dbt_project/data/duckdb.db ~/code/projects/mlb-data-lake/dbt_project/reports
npm --prefix ~/code/projects/mlb-data-lake/dbt_project/reports run dev