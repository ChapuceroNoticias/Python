from flask import Flask, request, jsonify
from ScrapingMod14 import get_news_content

app = Flask(__name__)

@app.route('/execute', methods=['POST'])
def execute():
    data = request.json
    url = data.get('input', 'No se recibió URL')
    try:
        title, body = get_news_content(url)
        result = {
            "title": title,
            "body": body
        }
    except Exception as e:
        result = {
            "error": f"Error al procesar la URL {url}: {str(e)}"
        }
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
