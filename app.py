from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# 1. ROTA DA TELA DE LOGIN 
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/index')
def index1():
    return render_template('index.html')


# 2. ROTA QUE VALIDA O FORMULÁRIO DE LOGIN E ENCAMINHA PARA O BANCO
@app.route('/login', methods=['POST'])
@app.route('/banco', methods=['GET', 'POST'])
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


# 3. ROTA QUE RECEBE OS DADOS DO FORMULÁRIO E SALVA NO BANCO
@app.route('/salvaritem', methods=['POST'])
def salvar_item():
    nome = request.form['nome']
    quantidade = request.form['quantidade']
    estoque = request.form['estoque']
    descricao = request.form['descricao']
    preco_form = request.form['preco']  
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


   
    # Comando SQL
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



# 5. ROTA PARA A PÁGINA DE RECUPERAÇÃO DE SENHA
@app.route('/esquecisenha')
def esquecisenha():
    return render_template('esquecisenha.html') 

       

# 6. ROTA PARA A PÁGINA DE CADASTRO DE USUÁRIOS
@app.route('/cadastrouser')
def cadastro():
    return render_template('cadastrouser.html')


# 7. ROTA PARA PAGINA MOVIMENTAÇÃO 
@app.route('/movimentacao', methods=['GET', 'POST'])
def tela_movimentar():
    try:
        conexao = mysql.connector.connect(
            host='localhost', port=3306, database='almoxarifado', user='root', password=''
        )
        cursor = conexao.cursor()
        cursor.execute('SELECT Id, Nome, Quantidade FROM estoque')
        itens = cursor.fetchall()
        cursor.close()
        conexao.close()
        
       
        return render_template('movimentacao.html', itens=itens)
        
    except mysql.connector.Error as erro:
        print(f"Erro: {erro}")
        return "Erro ao carregar itens", 500

@app.route('/salvar', methods=['POST'])
def salvar():
        
        id = request.form.get('id_item')
        opcao = request.form.get('tipo')
        qtde = int(request.form.get('quantidade'))
        
        conexao = mysql.connector.connect(
            host='localhost', port=3306, database='almoxarifado', user='root', password=''
        )
        cursor = conexao.cursor()
        cursor.execute ('SELECT Quantidade FROM estoque WHERE id = %s', (id,))
        
        qtde_banco = cursor.fetchone()

        if opcao == 'entrada':
            qtde_atualizada = qtde_banco[0] + qtde
            cursor.execute('UPDATE estoque SET Quantidade = %s WHERE id = %s', (qtde_atualizada, id,))
        
        if opcao == 'saida':
            qtde_atualizada = qtde_banco[0] - qtde
            cursor.execute('UPDATE estoque SET Quantidade = %s WHERE id = %s', (qtde_atualizada, id,))

        cursor.close()
        conexao.close()
        
        return redirect(url_for('banco'))
        
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
