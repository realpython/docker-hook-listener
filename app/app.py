import os
import subprocess
from flask import Flask, jsonify, request


app = Flask(__name__)


@app.route('/')
def index():
    return 'Test!'


@app.route('/ping', methods=['POST'])
def pong():
    if request.method == 'POST':
        token = request.args.get('token')
        if token == os.environ.get('TOKEN'):
            subprocess.call("deploy.sh")
            return jsonify(success=True)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
