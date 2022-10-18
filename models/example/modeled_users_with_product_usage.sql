

/*
    This is a data model that pulls user data from all sources (Customer 360)
    If you need access to all users captured across Sales, Marketing, Support, and Product.
*/

{{ config(materialized='table') }}



SELECT
  user_id,
  first_name,
  last_name,
  email,
  CEIL(engagement_last_7_days/4) AS "DASHBOARD_VIEWS",
  CEIL(engagement_last_7_days/3) AS "PAGEVIEWS",
  vip_customer AS "TRIAL_USER",
  engagement_last_7_days
FROM
  PRISTINE_ECOMMERCE.PUBLIC.USERS 


  -- PRISTINE_ECOMMERCE.PUBLIC.USERS ORDER BY RANDOM() limit 50

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null