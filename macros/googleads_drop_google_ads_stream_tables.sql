-- This macro drops the stream tables from the GoogleAds data source.

-- We run this macro by invoking it through meltano: `meltano invoke dbt run-operation drop_google_ads_stream_tables`

-- Dropping these tables are an easy way to ensure that the 
{%- macro googleads_drop_google_ads_stream_tables() -%}
    {% set tables = ["stream_accessible_customers",
                    "stream_adgroups",
                    "stream_adgroupsperformance",
                    "stream_campaign",
                    "stream_campaign_performance",
                    "stream_campaign_performance_by_age_range_and_device",
                    "stream_campaign_performance_by_gender_and_device",
                    "stream_campaign_performance_by_location",
                    "stream_customer_hierarchy",
                    "stream_customers",
                    "stream_geo_target_constant"] %}
    {% for t in tables %}
        {%- set drop_query -%}
            DROP TABLE IF EXISTS {{ target.schema }}.{{t}}
        {%- endset -%}
        {% do run_query(drop_query) %}
    {% endfor %}
{%- endmacro -%}