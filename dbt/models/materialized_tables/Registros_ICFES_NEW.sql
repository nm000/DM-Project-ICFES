{{ config(materialized='table') }}

SELECT DISTINCT
    ESTU_CONSECUTIVO AS ID,
    ESTU_NACIONALIDAD AS Nacionalidad,
    ESTU_PAIS_RESIDE AS PaisResidencia,
    PUNT_GLOBAL AS PuntGlobal,
    PUNT_C_NATURALES AS PuntCiencias,
    PUNT_LECTURA_CRITICA AS PuntLectura,
    PUNT_SOCIALES_CIUDADANAS AS PuntSociales,
    COLE_CALENDARIO AS CalendarioCole,
    ESTU_GENERO AS Genero,
    ESTU_MCPIO_RESIDE AS MunicipioRes,
    FAMI_EDUCACIONPADRE AS EduPadre,
    FAMI_EDUCACIONMADRE AS EduMadre,
    COLE_JORNADA AS JornadaCole,
    COLE_NATURALEZA AS NaturalezaCole,
    ESTU_MCPIO_PRESENTACION AS MunicipioPresentacion,
    COLE_NOMBRE_ESTABLECIMIENTO AS NombreCole,
    COLE_MCPIO_UBICACION AS MunicipioCole,
    COLE_CARACTER AS CaracterCole,
    COLE_AREA_UBICACION AS ZonaCole,
    PUNT_MATEMATICAS AS PuntMates,
    FAMI_TIENECOMPUTADOR AS TienePC,
    FAMI_TIENEINTERNET AS TieneInternet,
    FAMI_TIENEAUTOMOVIL AS TieneAuto,
    FAMI_TIENELAVADORA AS TieneLavadora,
    COLE_SEDE_PRINCIPAL AS SedePrincipal,
    ESTU_PRIVADO_LIBERTAD AS PrivadoLibertad,
    COLE_BILINGUE AS ColeBilingue,
    FAMI_ESTRATOVIVIENDA AS Estrato,
    PUNT_INGLES AS PuntIngles,
    DESEMP_INGLES AS DesempIngles,
    PERIODO AS Periodo,
    ESTU_DEPTO_RESIDE AS DptoRes,
    ESTU_DEPTO_PRESENTACION AS DptoPresentacion,
    COLE_DEPTO_UBICACION AS DptoCole,
    FAMI_PERSONASHOGAR AS HabitantesHogar,
    FAMI_CUARTOSHOGAR AS CuartosHogar
FROM {{ source("Resultados_ICFES","Registros_ICFES") }}
WHERE PUNT_GLOBAL IS not NULL AND PUNT_INGLES IS NOT NULL