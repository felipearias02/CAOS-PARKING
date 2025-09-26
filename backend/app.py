from flask import Flask, request, jsonify
from backend.queries.queries import buscar_parqueaderos_por_apartamento
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route("/buscar", methods=["GET"])
def buscar():
    numero = request.args.get("apartamento")
    if not numero:
        return jsonify({"error": "Número de apartamento requerido"}), 400

    resultado = buscar_parqueaderos_por_apartamento(numero)
    return jsonify(resultado)

if __name__ == "__main__":
    app.run(debug=True)