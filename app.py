from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/execute', methods=['POST'])
def execute():
    data = request.json
    input_text = data.get('input', 'No se recibió texto')
    result = {"output": f"¡Hola! Recibí este texto: {input_text}"}
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)