WITH BIKE AS (


SELECT

distinct
start_station_id AS station_id,
start_station_name AS station_name,
start_lat AS start_lat,
start_lng AS start_lng

FROM {{ source('demo', 'bike') }}

WHERE RIDE_ID != 'ride_id'

limit 10

)

select * from BIKE