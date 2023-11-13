import graphene
import modelHandler as handler
import numpy as np
import joblib

class Prediction(graphene.ObjectType):
  predictionString = graphene.String()

class Query(graphene.ObjectType):
  clasePuntaje = graphene.List(Prediction,
                               periodo = graphene.Int(),
                               jornadaCole = graphene.String(),
                               eduMadre = graphene.String(),
                               eduPadre = graphene.String(),
                               estrato = graphene.Int(),
                               departamento = graphene.String(),
                               caracterCole = graphene.String(),
                               tienePc = graphene.Boolean())
  def resolve_clasePuntaje(self, info, periodo, jornadaCole, eduMadre, eduPadre, estrato, departamento, caracterCole, tienePc):
    model = joblib.load('modelRandomForest_top9.joblib')
    jornadaCole = handler.getValues_jornadaCole(jornadaCole)
    eduMadre = handler.getValues_eduMadre(eduMadre)
    eduPadre = handler.getValues_eduPadre(eduPadre)
    caracterCole = handler.getValues_caracterCole(caracterCole)
    latitud, longitud = handler.obtener_coordenadas(departamento)
    input = np.array([jornadaCole, eduMadre, eduPadre, caracterCole, periodo, estrato, latitud, longitud, tienePc]).reshape(1,-1)
    return [Prediction(predictionString=model.predict(input)[0])]
  