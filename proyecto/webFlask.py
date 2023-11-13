from flask import Flask, request, render_template
import graphene
from graphService import Query

app = Flask(__name__)
app.template_folder = './'

schema = graphene.Schema(query=Query)

@app.route('/')
def index():
    return render_template('index.html', css_files=['style.css'])

@app.route('/procesar', methods=['POST'])
def procesar():
    periodo = int(request.form.get('periodo'))
    jornadaCole = str(request.form.get('jornada'))
    eduMadre = str(request.form.get('educacionMadre'))
    eduPadre = str(request.form.get('educacionPadre'))
    estrato = int(request.form.get('estrato'))
    departamento = str(request.form.get('departamento'))
    caracterCole = str(request.form.get('caracterCole'))
    tienePc = "true" if request.form.get('pc') == "Si" else "false"

    query = f'''
        {{
        clasePuntaje(
                periodo: {periodo},
                jornadaCole: "{jornadaCole}",
                eduMadre: "{eduMadre}",
                eduPadre: "{eduPadre}",
                estrato: {estrato},
                departamento: "{departamento}",
                caracterCole: "{caracterCole}",
                tienePc: {tienePc}
            ) {{
                predictionString
            }}
        }}
    '''
    
    result = schema.execute(query)

    return render_template('index.html', css_files=['style.css'], result=str(result.data.get("clasePuntaje")[0]["predictionString"]))

    

if __name__ == '__main__':  #Para levantar el servicio
    #ModelHandler = modelHandler()
    app.run(debug=True)