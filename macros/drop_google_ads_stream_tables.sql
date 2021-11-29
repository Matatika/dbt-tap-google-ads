-- This macro drops the stream tables from the GoogleAds data source.

-- We run this macro by invoking it through meltano: `meltano invoke dbt run-operation drop_google_ads_stream_tables`

-- Dropping these tables are an easy way to ensure that the 
{%- macro drop_google_ads_stream_tables() -%}
    {%- set drop_query -%}
        DROP TABLE {{ target.schema }}.stream_accessible_customers
        DROP TABLE {{ target.schema }}.stream_adgroups
        DROP TABLE {{ target.schema }}.stream_adgroupsperformance
        DROP TABLE {{ target.schema }}.stream_campaign
        DROP TABLE {{ target.schema }}.stream_campaign_performance
        DROP TABLE {{ target.schema }}.stream_campaign_performance_by_age_range_and_device
        DROP TABLE {{ target.schema }}.stream_campaign_performance_by_gender_and_device
        DROP TABLE {{ target.schema }}.stream_campaign_performance_by_location
        DROP TABLE {{ target.schema }}.stream_customer_hierarchystream
        DROP TABLE {{ target.schema }}.stream_customers
        DROP TABLE {{ target.schema }}.stream_geo_target_constant
    {%- endset -%}
    {% do run_query(drop_query) %}
{%- endmacro -%}