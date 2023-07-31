# mlb-data-lake

### High Level Architecture
![high level architecture](./images/high-level-architecture-diagram.png)

[Miro Board](https://lucid.app/lucidchart/64b88329-46d6-4283-b875-fea82e9b328a/edit?view_items=DHbh.MwD~tuD&invitationId=inv_aec05db6-afbd-4dc8-831b-353bb2e5a6ce)

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
* PROD
    * GHA run dbt with s3 external source tables and motherduck backend
    * GHA build evidence 

### Setup

* DEV
* UAT
* PROD