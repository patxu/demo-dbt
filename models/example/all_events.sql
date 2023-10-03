
/*
    This is a data model that pulls data user data from Client & Server tracking.
    You can use the event name column to determine what the event is.
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from patxu_testing
/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null