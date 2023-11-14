{{ config(materialized='table') }}
SELECT 
  t.* EXCEPT(CalendarioCole,Genero,MunicipioRes,EduPadre,EduMadre,JornadaCole,NaturalezaCole,MunicipioPresentacion,NombreCole,MunicipioCole,CaracterCole,ZonaCole,TienePC,TieneInternet,TieneAuto,TieneLavadora,SedePrincipal,PrivadoLibertad,ColeBilingue,Estrato,DptoRes,DptoPresentacion,DptoCole,HabitantesHogar,CuartosHogar),
    IFNULL(t.CalendarioCole,mo.CalendarioCole) AS CalendarioCole,
    IFNULL(t.Genero,mo.Genero) AS Genero,
    IFNULL(t.MunicipioRes,mo.MunicipioRes) AS MunicipioRes,
    IFNULL(t.EduPadre,mo.EduPadre) AS EduPadre,
    IFNULL(t.EduMadre,mo.EduMadre) AS EduMadre,
    IFNULL(t.JornadaCole,mo.JornadaCole) AS JornadaCole,
    IFNULL(t.NaturalezaCole,mo.NaturalezaCole) AS NaturalezaCole,
    IFNULL(t.MunicipioPresentacion,mo.MunicipioPresentacion) AS MunicipioPresentacion,
    IFNULL(t.NombreCole,mo.NombreCole) AS NombreCole,
    IFNULL(t.MunicipioCole,mo.MunicipioCole) AS MunicipioCole,
    IFNULL(t.CaracterCole,mo.CaracterCole) AS CaracterCole,
    IFNULL(t.ZonaCole,mo.ZonaCole) AS ZonaCole,
    IFNULL(t.TienePC,mo.TienePC) AS TienePC,
    IFNULL(t.TieneInternet,mo.TieneInternet) AS TieneInternet,
    IFNULL(t.TieneAuto,mo.TieneAuto) AS TieneAuto,
    IFNULL(t.TieneLavadora,mo.TieneLavadora) AS TieneLavadora,
    IFNULL(t.SedePrincipal,mo.SedePrincipal) AS SedePrincipal,
    IFNULL(t.PrivadoLibertad,mo.PrivadoLibertad) AS PrivadoLibertad,
    IFNULL(t.ColeBilingue,mo.ColeBilingue) AS ColeBilingue,
    IFNULL(t.Estrato,mo.Estrato) AS Estrato,
    IFNULL(t.DptoRes,mo.DptoRes) AS DptoRes,
    IFNULL(t.DptoPresentacion,mo.DptoPresentacion) AS DptoPresentacion,
    IFNULL(t.DptoCole,mo.DptoCole) AS DptoCole,
    IFNULL(t.HabitantesHogar,mo.HabitantesHogar) AS HabitantesHogar,
    IFNULL(t.CuartosHogar,mo.CuartosHogar) AS CuartosHogar
FROM 
  {{  source("Resultados_ICFES","Registros_ICFES_M") }} t , {{ ref("ICFES_IMP_Moda") }} mo

