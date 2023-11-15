{{ config(materialized='table') }}
SELECT * EXCEPT(Periodo,PuntMates,PuntIngles,EduPadre,EduMadre,Estrato,TienePC,TieneInternet,TieneAuto,TieneLavadora,SedePrincipal,PrivadoLibertad,ColeBilingue, Nacionalidad, PaisResidencia,PuntCiencias,PuntLectura,PuntSociales,DesempIngles,MunicipioRes,MunicipioPresentacion,NombreCole,MunicipioCole,DptoRes,DptoPresentacion,DptoCole,HabitantesHogar,CuartosHogar),
  CAST(LEFT(CAST(Periodo AS STRING), 4) AS INT64) AS Periodo,
  -- Transformaciones para EduPadre
  CASE
    WHEN EduPadre LIKE '%Secundaria%' THEN 'Secundaria' 
    WHEN EduPadre LIKE '%Primaria%' THEN 'Primaria'
    WHEN EduPadre LIKE '%profesional%' OR EduPadre LIKE '%Postgrado%' THEN 'Universitario'
    WHEN EduPadre LIKE '%Técnica%' THEN 'Técnica o tecnológica'
    ELSE 'No Aplica'
  END AS EduPadre,

  -- Transformaciones para EduMadre
  CASE
    WHEN EduMadre LIKE '%Secundaria%' THEN 'Secundaria' 
    WHEN EduMadre LIKE '%Primaria%' THEN 'Primaria'
    WHEN EduMadre LIKE '%profesional%' OR EduMadre LIKE '%Postgrado%' THEN 'Universitario'
    WHEN EduMadre LIKE '%Técnica%' THEN 'Técnica o tecnológica'
    ELSE 'No Aplica'
  END AS EduMadre,

  -- Transformaciones para Estrato
  CASE
    WHEN Estrato LIKE '%1%' THEN 1 
    WHEN Estrato LIKE '%2%' THEN 2
    WHEN Estrato LIKE '%3%' THEN 3
    WHEN Estrato LIKE '%4%' THEN 4
    WHEN Estrato LIKE '%5%' THEN 5
    WHEN Estrato LIKE '%6%' THEN 6
    ELSE 0
  END AS Estrato,

  -- Otras transformaciones para las demás columnas
  CASE WHEN TienePC = 'Si' THEN TRUE ELSE FALSE END AS TienePC,
  CASE WHEN TieneInternet = 'Si' THEN TRUE ELSE FALSE END AS TieneInternet,
  CASE WHEN TieneAuto = 'Si' THEN TRUE ELSE FALSE END AS TieneAuto,
  CASE WHEN TieneLavadora = 'Si' THEN TRUE ELSE FALSE END AS TieneLavadora,
  CASE WHEN SedePrincipal = 'S' THEN TRUE ELSE FALSE END AS SedePrincipal,
  CASE WHEN PrivadoLibertad = 'S' THEN TRUE ELSE FALSE END AS PrivadoLibertad,
  CASE WHEN ColeBilingue = 'S' THEN TRUE ELSE FALSE END AS ColeBilingue,

  -- Transformación para PuntajeAgrupado
  CASE
    WHEN PuntGlobal > 250 THEN 'Puntaje Alto'
    ELSE 'Puntaje Bajo'
  END AS PuntajeAgrupado

FROM {{  ref("Registros_ICFES_IMP") }}

