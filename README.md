# mlb-data-lake

### Description

This project builds is an end to end analytics system. Data is ingested to s3 then loaded and transformed in duckdb or motherduck and then visualized in evidence.dev. The site is deployed with netlify using GitHub Actions.

[mlb-data-lake.netlify.app](https://mlb-data-lake.netlify.app)

### High Level Architecture
![high level architecture](./images/high-level-architecture-diagram.png)

[Lucid Chart](https://lucid.app/lucidchart/64b88329-46d6-4283-b875-fea82e9b328a/edit?view_items=DHbh.MwD~tuD&invitationId=inv_aec05db6-afbd-4dc8-831b-353bb2e5a6ce)

### High Level Process

* GitHub Actions run .py scripts at 9:10 AM to write data to s3
* DEV
    * run aws s3 cp command to read data locally
    * run dbt with duckdb backend
    * move duckdb file to evidence directory
    * build evidence locally
    * update evidence connection settings
* UAT
    * run dbt with s3 external source tables and motherduck backend
    * build evidence locally
    * update evidence connection settings
* PROD (via GHA)
    * run dbt with s3 external source tables and motherduck backend
    * build and deploy evidence connected to motherduck

### Setup

* DEV
* UAT
* PROD

### To do

The to do list is created based on GitHub issues