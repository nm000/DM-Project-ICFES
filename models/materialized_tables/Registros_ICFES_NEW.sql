{{ config(materialized='table') }}

SELECT * 
FROM {{ source("Resultados_ICFES","Registros_ICFES") }}