WITH CTE AS (

Select 

t.*,
w.*

From {{ ref('trip_fact') }} t
left join {{ ref('daily_weather') }} w
on t.TRIP_DATE = w.DAILY_WEATHER


order by TRIP_DATE desc
--- limit 10

)

Select * from CTE