
/*
    High LTV
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from PRISTINE_ECOMMERCE.PUBLIC.USERS

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null