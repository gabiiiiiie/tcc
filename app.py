from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# 1. ROTA DA TELA DE LOGIN (RAIZ)
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/index')
def index1():
    return render_template('index.html')


# 2. ROTA QUE VALIDA O FORMULÁRIO DE LOGIN E ENCAMINHA PARA O BANCO
@app.route('/login', methods=['POST'])
@app.route('/banco', methods=['GET'])
def banco():
    conexao = mysql.connector.connect(
        host='localhost',
        port=3306,
        database='almoxarifado',
        user='root',
        password='' # Se o seu MySQL tiver senha, coloque-a aqui dentro das aspas
    )
    cursor = conexao.cursor()
    cursor.execute('SELECT * FROM estoque')
    resposta = cursor.fetchall()
    
    cursor.close()
    conexao.close()
    return render_template('banco.html', resposta=resposta)


# 3. ROTA QUE RECEBE OS DADOS DO FORMULÁRIO E SALVA NO BANCO
@app.route('/salvaritem', methods=['POST'])
def salvar_item():
    nome = request.form['nome']
    quantidade = request.form['quantidade']
    estoque = request.form['estoque']
    descricao = request.form['descricao']
    preco_form = request.form['preço']  # Captura com 'ç' correspondente ao seu HTML
    categoria = request.form['categoria']
    foto = request.form['foto']

    conexao = mysql.connector.connect(
        host='localhost',
        port=3306,
        database='almoxarifado',
        user='root',
        password=''
    )
    cursor = conexao.cursor()

    # Comando SQL usando a coluna 'Preco' sem acento como está no banco
    comando_sql = """
        INSERT INTO estoque (Nome, Quantidade, Estoque, Descricao, Preco, Categoria, Foto) 
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """
    valores = (nome, quantidade, estoque, descricao, preco_form, categoria, foto)
    
    cursor.execute(comando_sql, valores)
    conexao.commit()
    
    cursor.close()
    conexao.close()

    return render_template('itemcadastrado.html')


# 4. ROTA PARA ADICIONAR ITENS (ABRE O FORMULÁRIO DE CADASTRO DE PRODUTO)
@app.route('/adicionaritens', methods=['POST', 'GET'])
def adicionaritens():
    return render_template('adicionaritens.html')


# 5. ROTA QUE APENAS ABRE A TELA DO FORMULÁRIO DE EXCLUSÃO (FORA DA TABELA)
@app.route('/deletar', methods=['GET'])
def tela_deletar():
    return render_template('deletar.html')


# 6. ROTA QUE RECEBE O ID DO FORMULÁRIO E DELETA NO BANCO
@app.route('/confirmardeletar', methods=['POST'])
def confirmar_deletar():
    id_recebido = request.form['id_item']

    conexao = mysql.connector.connect(
        host='localhost',
        port=3306,
        database='almoxarifado',
        user='root',
        password=''
    )
    cursor = conexao.cursor()

    comando_sql = "DELETE FROM estoque WHERE Id = %s"
    cursor.execute(comando_sql, (id_recebido,))
    conexao.commit()
    
    cursor.close()
    conexao.close()

    return redirect(url_for('banco'))


# 7. ROTA PARA A PÁGINA DE RECUPERAÇÃO DE SENHA
@app.route('/esquecisenha')
def esquecisenha():
    return render_template('esquecisenha.html')


# 8. ROTA PARA A PÁGINA DE CADASTRO DE USUÁRIOS
@app.route('/cadastro')
def cadastro():
    return render_template('cadastro.html')


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
