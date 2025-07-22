from flask import Flask, jsonify, request
import mysql.connector as db

mydb = db.connect(
    host = 'localhost',
    port = 3306,
    user = 'root',
    passwd = 'Nw53zv45$$',
    use_pure = True,
    database = 'jav2'
)

print(mydb)

miCursor = mydb.cursor()

app = Flask(__name__)

def main():
	app.run(debug=True)

    
@app.route("/api/personas/<run_persona>/<dv_persona>")  
def get_user(run_persona,dv_persona):
    sql_SELECT = "SELECT c.nombre, c.tipo_contacto, c.valor_contacto, c.id_persona FROM jav2.personas as p, jav2.contactos_persona as c WHERE p.run_persona = " + run_persona + " AND p.dv_persona = " + dv_persona + " AND p.id_persona = c.id_persona;" 
      
    miCursor.execute(sql_SELECT)
    output_db = miCursor.fetchall()
    
    if len(output_db) > 0:
        id_tipo = 0
        respuesta = {"id_persona": output_db[0][3], "contactos": []}
        for record in output_db:
            if record[1] == "telefono":
                id_tipo = 1
            elif record[1] == "celular":
                id_tipo = 2
            elif record[1] == "correo":
                id_tipo = 3
            respuesta["contactos"].append(
                {"etiqueta": record[1], "tipo": id_tipo, "valor": record[2]}
            )
        return jsonify(respuesta), 200
    else:
        respuesta = {"error": "persona no encontrada"}
        return jsonify(respuesta), 404
    
if __name__ == "__main__":
    main()