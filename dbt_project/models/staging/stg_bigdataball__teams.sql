with source as (
    select 
        "yearid",
        "lgid",
        "teamid",
        "franchid",
        "divid",
        "rank",
        "g",
        "ghome",
        "w",
        "l",
        "divwin",
        "wcwin",
        "lgwin",
        "wswin",
        "r",
        "ab",
        "h",
        "2b",
        "3b",
        "hr"

        from {{ source('bigdataball', 'teams')}}
    )

select *
from source
