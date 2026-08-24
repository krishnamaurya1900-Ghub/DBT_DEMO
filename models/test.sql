select 
*
From {{ source('demo', 'bike') }}

limit 10
