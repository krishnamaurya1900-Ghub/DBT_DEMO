--- here CTE IS daily_weather

WITH daily_weather AS (

-- select * from {{ source('demo', 'weather') }}

select 
    DATE(TIME) AS DAILY_WEATHER,
    WEATHER,
    TEMP,
    PRESSURE,
    HUMIDITY,
    CLOUD


from {{ source('demo', 'weather') }}

-- limit 10

),

-- added another CTE : daily_weather_agg
daily_weather_agg as (

select

daily_weather,
weather,
round(avg(TEMP),2) AS AVG_TEMP,
round(avg(PRESSURE),2) AS AVG_PRESSURE,
round(avg(HUMIDITY),2) AS AVG_HUMIDITY,
round(avg(CLOUD),2) AS AVG_CLOUD,
count(weather),
ROW_NUMBER() OVER(PARTITION BY daily_weather ORDER BY count(weather) desc) AS row_number

from daily_weather

group by daily_weather, weather

-- we cannot use 'where' statement with window function but we can use its substitute ie 'qualify'
qualify ROW_NUMBER() OVER(PARTITION BY daily_weather ORDER BY count(weather) desc)=1

)

-- SELECT * FROM daily_weather
SELECT * FROM daily_weather_agg