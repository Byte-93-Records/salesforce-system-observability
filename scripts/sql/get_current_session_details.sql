-- This script retrieves current session information in Snowflake
SELECT 
    CURRENT_USER() AS user,
    CURRENT_ACCOUNT() AS account,
    CURRENT_WAREHOUSE() AS warehouse,
    CURRENT_DATABASE() AS database,
    CURRENT_SCHEMA() AS schema;