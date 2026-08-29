----- this file will hold all the macros related to date 

--- Ginja
--- {{}} --- for variables and call functions

--- {% %}--- defining macros or for loops

---- DEFINING A MACRO FUNCTION

{% macro function1(x) %}

CASE 
WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE
THEN 'PAST'
ELSE 'FUTURE'
END

{% endmacro %}

--- CALLING ABOVE MACRO
--- {{function1('')}}

{%  macro get_season(x) %}

CASE WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2)
THEN 'WINTER'
WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5)
THEN 'SPRING'
WHEN  MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8)
THEN 'SUMMER'
ELSE 'AUTOMN'
END

{% endmacro %}



{% macro day_type(x) %}

CASE 
WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END

{% endmacro %}