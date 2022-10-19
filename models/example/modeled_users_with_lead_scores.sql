

/*
    This is a data model that pulls user data from all sources (Customer 360)
    This joins data with lead scores developed from data engineering team
*/






{{ config(materialized='table') }}



SELECT
  user_id,
  first_name,
  last_name,
  email,
  CEIL(engagement_last_7_days/2) AS "LEAD_SCORE",
  CEIL(engagement_last_7_days/3) AS "LEAD_GRADE",
  vip_customer AS "ACTIVE_POC",
  engagement_last_7_days
FROM
  PRISTINE_ECOMMERCE.PUBLIC.USERS 



/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null