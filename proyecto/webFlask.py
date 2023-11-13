from flask import Flask, request, jsonify, render_template
#from modelHandler import modelHandler
import graphene
import requests
from graphService import Query

app = Flask(__name__)
app.template_folder = './'

schema = graphene.Schema(query=Query)

@app.route('/')
def index():
    return render_template('index.html', css_files=['style.css'])

@app.route('/procesar', methods=['POST'])

def procesar():
    #http://127.0.0.1:5000/?periodo=2020&&jornada="MAÑANA"&&educacionMadre="Primaria"&&educacionPadre="Secundaria"&&estrato=2&&departamento="VAUPES"&&caracterCole="ACADÉMICO"&&pc=true
    url = "http://127.0.0.1:5000"
    periodo = int(request.form.get('periodo'))
    jornadaCole = request.form.get('jornada')
    eduMadre = request.form.get('educacionMadre')
    eduPadre = request.form.get('educacionPadre')
    estrato = int(request.form.get('estrato'))
    departamento = request.form.get('departamento')
    caracterCole = request.form.get('caracterCole')
    tienePc = request.form.get('pc') == "Si"

    data = [periodo, jornadaCole, eduMadre, eduPadre, estrato, departamento, caracterCole, tienePc]

    print(data)

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
                tiene_pc: {tienePc}
            ) {{
                predictionString
            }}
        }}
    """
    
    result = schema.execute(query)
    print(result)

    return data

    

if __name__ == '__main__':  #Para levantar el servicio
    #ModelHandler = modelHandler()
    app.run(debug=True)


