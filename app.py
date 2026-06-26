from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# 1. ROTA DA TELA DE LOGIN (RAIZ)
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/index')
def index1():
    return render_template('index.html')


# 2. ROTA QUE RECEBE OS DADOS DO FORMULÁRIO E SALVA NO BANCO
@app.route('/salvaritem', methods=['POST'])
def salvar_item():
    # Coleta as informações digitadas no formulário HTML
    nome = request.form['nome']
    quantidade = request.form['quantidade']
    estoque = request.form['estoque']
    descricao = request.form['descricao']
    preco = request.form['preco']
    categoria = request.form['categoria']
    foto = request.form['foto']

    # Abre a conexão com o MySQL
    conexao = mysql.connector.connect(
        host='localhost',
        port=3306,
        database='almoxarifado',
        user='root',
        password='' # Se o seu MySQL tiver senha, coloque-a aqui dentro das aspas
    )
    cursor = conexao.cursor()

    # Comando SQL para inserir os dados na tabela estoque (Preco sem o ç)
    comando_sql = """
        INSERT INTO estoque (Nome, Quantidade, Estoque, Descricao, Preco, Categoria, Foto) 
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """
    valores = (nome, quantidade, estoque, descricao, preco, categoria, foto)
    
    # Executa o comando e salva no banco de dados
    cursor.execute(comando_sql, valores)
    conexao.commit()
    
    # Fecha o cursor e a conexão com segurança
    cursor.close()
    conexao.close()

    # Retorna a nova página com o nome atualizado que você pediu
    return render_template('itemcadastrado.html')


# 3. ROTA DA TABELA DO ALMOXARIFADO (EXIBE OS PRODUTOS)
@app.route('/banco', methods=['POST', 'GET'])
def banco():
    conexao = mysql.connector.connect(
        host='localhost',
        port=3306,
        database='almoxarifado',
        user='root',
        password=''
    )
    cursor = conexao.cursor()
    cursor.execute('SELECT * FROM estoque')
    resposta = cursor.fetchall()
    
    cursor.close()
    conexao.close()
    return render_template('banco.html', resposta=resposta)


# 4. ROTA PARA ADICIONAR ITENS (ABRE O FORMULÁRIO DE CADASTRO)
@app.route('/adicionaritens', methods=['POST', 'GET'])
def adicionaritens():
    return render_template('adicionaritens.html')


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
