{{ config(materialized='table') }}


select *, CURRENT_DATE() as CAPI_Date
from PRISTINE_ECOMMERCE.PUBLIC.EVENTS