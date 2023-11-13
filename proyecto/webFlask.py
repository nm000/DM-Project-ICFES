from flask import Flask, request, jsonify
#from modelHandler import modelHandler
import graphene
#import requests
from graphService import Query

app = Flask(__name__)

schema = graphene.Schema(query=Query)

@app.route('/', methods=['GET'])
def procesar():
    #http://127.0.0.1:5000/?periodo=2020&&jornada="MAÑANA"&&educacionMadre="Primaria"&&educacionPadre="Secundaria"&&estrato=2&&departamento="VAUPES"&&caracterCole="ACADÉMICO"&&pc=true
    periodo = request.args.get('periodo')
    jornadaCole = request.args.get('jornada')
    eduMadre = request.args.get('educacionMadre')
    eduPadre = request.args.get('educacionPadre')
    estrato = request.args.get('estrato')
    departamento = request.args.get('departamento')
    caracterCole = request.args.get('caracterCole')
    tienePc = request.args.get('pc')

   

    query = f"""
        {{
        clasePuntaje(
                periodo: {periodo},
                jornadaCole: {jornadaCole},
                eduMadre: {eduMadre},
                eduPadre: {eduPadre},
                estrato: {estrato},
                departamento: {departamento},
                caracterCole: {caracterCole},
                tienePc: {tienePc}
            ) {{
                predictionString
            }}
        }}
    """
    
    result = schema.execute(query)
    print(result)

    return jsonify(result.data)

    

if __name__ == '__main__': #Para levantar el servicio
    #ModelHandler = modelHandler()
    app.run(debug=True)


