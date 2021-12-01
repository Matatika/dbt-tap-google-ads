-- This macro drops the stream tables from the GoogleAds data source.

-- We run this macro by invoking it through meltano: `meltano invoke dbt run-operation drop_google_ads_stream_tables`

-- Dropping these tables are an easy way to ensure that the 
{%- macro drop_google_ads_stream_tables() -%}
    {%- set drop_query -%}
        DROP TABLE 
        {{ target.schema }}.stream_accessible_customers
        , {{ target.schema }}.stream_adgroups
        , {{ target.schema }}.stream_adgroupsperformance
        , {{ target.schema }}.stream_campaign
        , {{ target.schema }}.stream_campaign_performance
        , {{ target.schema }}.stream_campaign_performance_by_age_range_and_device
        , {{ target.schema }}.stream_campaign_performance_by_gender_and_device
        , {{ target.schema }}.stream_campaign_performance_by_location
        , {{ target.schema }}.stream_customer_hierarchy
        , {{ target.schema }}.stream_customers
        , {{ target.schema }}.stream_geo_target_constant
    {%- endset -%}
    {% do run_query(drop_query) %}
{%- endmacro -%}