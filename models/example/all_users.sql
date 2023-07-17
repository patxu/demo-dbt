
/*
    This is a data model that pulls user data from all sources (Customer 360)
    If you need access to all users captured across Sales, Marketing, Support, and Product.
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select null as id

)



SELECT ROW_NUMBER() OVER (ORDER BY RANDOM(1)) AS PRIMARY_KEY,
       CAST(ROW_NUMBER() OVER (ORDER BY RANDOM(1)) AS varchar) AS PRIMARY_KEY_STR,
       ROW_NUMBER() OVER (ORDER BY RANDOM(1)) || '-' || EMAIL AS EMAIL,
t.user_id,
t.first_name,
t.last_name,
CEIL(engagement_last_7_days/4) AS "DASHBOARD_VIEWS",
t.vip_customer AS "TRIAL_USER",
t.vip_customer,
t.engagement_last_7_days,
DATEADD(hours, -engagement_last_7_days, CURRENT_DATE()) AS "SIGN_UP_DATE",
CEIL(engagement_last_7_days/4) AS "NUM_BLOG_POSTS_VIEWED",
CEIL(engagement_last_7_days/3) AS "PAGEVIEWS",
t.brand_affinity AS "FAVORITE_BRAND",
t.vip_customer AS "AD_CONVERSION",
CEIL(engagement_last_7_days/2) AS "LEAD_SCORE",
CEIL(engagement_last_7_days/3) AS "LEAD_GRADE",
t.vip_customer AS "ACTIVE_POC"
from PRISTINE_ECOMMERCE.PUBLIC.USERS t
CROSS JOIN (
  VALUES (1), (2), (3), (4), (5), (6)
) AS multiplier (repeat)


-- select
--   user_id,
--   first_name,
--   last_name,
--   email,
--   CEIL(engagement_last_7_days/4) AS "DASHBOARD_VIEWS",
--   vip_customer AS "TRIAL_USER",
--   vip_customer,
--   engagement_last_7_days,
--   DATEADD(hours, -engagement_last_7_days, CURRENT_DATE()) AS "SIGN_UP_DATE",
--   CEIL(engagement_last_7_days/4) AS "NUM_BLOG_POSTS_VIEWED",
--   CEIL(engagement_last_7_days/3) AS "PAGEVIEWS",
--   brand_affinity AS "FAVORITE_BRAND",
--   vip_customer AS "AD_CONVERSION",
--   CEIL(engagement_last_7_days/2) AS "LEAD_SCORE",
--   CEIL(engagement_last_7_days/3) AS "LEAD_GRADE",
--   vip_customer AS "ACTIVE_POC"
-- from PRISTINE_ECOMMERCE.PUBLIC.USERS


/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null