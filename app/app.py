import os
import subprocess
from flask import Flask, jsonify, request


app = Flask(__name__)


@app.route('/')
def index():
    return 'Test!'


@app.route('/ping', methods=['GET', 'POST'])
def pong():
    if request.method == 'POST':
        token = request.args.get('token')
        if str(token) == str(os.environ.get('TOKEN')):
            subprocess.call("deploy.sh", shell=True)
            return jsonify(success=True)
        return jsonify(success=False), 500
    if request.method == 'GET':
        return "pong!"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
