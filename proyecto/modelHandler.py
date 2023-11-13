import joblib
from geopy.geocoders import Nominatim

def obtener_coordenadas(departamento, pais="COLOMBIA"):
    geolocalizador = Nominatim(user_agent="Geocodificación_Departamentos_Colombia")  # Reemplaza "mi_app" con tu propio identificador

    ubicacion = geolocalizador.geocode(f"{departamento}, {pais}")

    if ubicacion is not None:
        latitud = ubicacion.latitude
        longitud = ubicacion.longitude
        return latitud, longitud
    else:
        print(f"No se encontraron resultados para {departamento}")
        return None

def getValues_jornadaCole(jornada):
  values = joblib.load('jornadaCole.joblib')
  return values[jornada]

def getValues_eduMadre(edu):
  values = joblib.load('eduMadre.joblib')
  return values[edu]

def getValues_eduPadre(edu):
  values = joblib.load('eduPadre.joblib')
  return values[edu]
  
def getValues_caracterCole(caracter):
  values = joblib.load('caracterCole.joblib')
  return values[caracter] 




