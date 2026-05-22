from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/index')
def index1():
    return render_template('index.html')

@app.route('/banco', methods=['POST', 'GET'])
def banco():
    conexao = mysql.connector.connect (
        host='localhost',
        port=3306,
        database= 'almoxarifado',
        user='root',
        password=''
    )

    cursor = conexao.cursor()

    cursor.execute('SELECT * FROM estoque'),

    resposta = cursor.fetchall()

    return render_template('banco.html', resposta=resposta)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')