

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
  gender,
  DATEADD(hours, engagement_last_7_days, CURRENT_DATE()) AS "SIGN_UP_DATE",
  CEIL(engagement_last_7_days/4) AS "NUM_BLOG_POSTS_VIEWED",
  CEIL(engagement_last_7_days/3) AS "PAGEVIEWS",
  brand_affinity AS "FAVORITE_BRAND",
  vip_customer AS "AD_CONVERSION",
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