from flask import Flask, render_template, request, redirect, url_for, flash, session
import mysql.connector

app = Flask(__name__)
# Chave para usar flash
app.secret_key = 'chave_secreta_para_seguranca'

# CONFIGURAÇÃO DE CONEXÃO PADRÃO 
def obter_conexao():
    return mysql.connector.connect(
        host='localhost',
        port=3306,
        database='almoxarifado',
        user='root',
        password=''
    )

# 1. ROTA DA TELA DE LOGIN (INDEX)
@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')


# 2. ROTA QUE VALIDA O LOGIN
@app.route('/login', methods=['POST'])
def login():
    # Coleta os dados que o usuário digitou no formulário do index.html
    username_digitado = request.form.get('username')
    password_digitada = request.form.get('password')

    try:
        conexao = obter_conexao()
        cursor = conexao.cursor()
        
        # Busca na tabela 'usuarios' se existe a combinação de nome e senha digitados
        comando = "SELECT * FROM usuarios WHERE username = %s AND password = %s"
        cursor.execute(comando, (username_digitado, password_digitada))
        usuario_encontrado = cursor.fetchone()
        
        cursor.close()
        conexao.close()

        # Se encontrou o usuário no banco
        if usuario_encontrado:
            session['usuario_logado'] = username_digitado # Salva na sessão do navegador
            return redirect(url_for('banco')) # Encarrega para a página do estoque
        else:
            flash('Usuário ou senha incorretos!', 'erro_login') # Envia aviso de erro
            return redirect(url_for('index')) # Devolve para a tela de login

    except mysql.connector.Error as erro:
        print(f"Erro no banco de dados: {erro}")
        flash('Erro técnico ao conectar com o banco.', 'erro_login')
        return redirect(url_for('index'))


# ROTA QUE EXIBE OS ITENS DO ESTOQUE (Apenas após o login)
@app.route('/banco', methods=['GET'])
def banco():
    # BLOQUEIO DE SEGURANÇA: Se o usuário tentar acessar direto sem logar, é expulso
    if 'usuario_logado' not in session:
        return redirect(url_for('index'))

    try:
        conexao = obter_conexao()
        cursor = conexao.cursor()
        cursor.execute('SELECT * FROM estoque')
        resposta = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        return render_template('banco.html', resposta=resposta)
    except mysql.connector.Error as erro:
        return f"Erro ao carregar estoque: {erro}", 500


# ROTA PARA LOGOUT (SAIR DO SISTEMA)
@app.route('/logout')
def logout():
    session.pop('usuario_logado', None) # Destrói a sessão
    return redirect(url_for('index'))


# 3. ROTA QUE RECEBE OS DADOS DO FORMULÁRIO E SALVA NO BANCO
@app.route('/salvaritem', methods=['POST'])
def salvar_item():
    if 'usuario_logado' not in session: return redirect(url_for('index'))
    
    nome = request.form['nome']
    quantidade = request.form['quantidade']
    estoque = request.form['estoque']
    descricao = request.form['descricao']
    preco_form = request.form['preco']  
    categoria = request.form['categoria']
    foto = request.form['foto']

    conexao = obter_conexao()
    cursor = conexao.cursor()

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


# 4. ROTA PARA ADICIONAR ITENS 
@app.route('/adicionaritens', methods=['POST', 'GET'])
def adicionaritens():
    if 'usuario_logado' not in session: return redirect(url_for('index'))
    return render_template('adicionaritens.html')



@app.route('/salvaruser', methods=['POST'])
def salvar_usuario():
    # Coleta os dados enviados pelo formulário do cadastrouser.html
    novo_usuario = request.form.get('novo_username')
    nova_senha = request.form.get('nova_senha')

    try:
        conexao = obter_conexao()
        cursor = conexao.cursor()

        # Insere o novo usuário e senha na tabela 
        comando_sql = "INSERT INTO usuarios (username, password) VALUES (%s, %s)"
        cursor.execute(comando_sql, (novo_usuario, nova_senha))
        
        conexao.commit() # Confirma a gravação no banco de dados
        cursor.close()
        conexao.close()

        # Redireciona o usuário para a tela de login após cadastrar com sucesso
        flash('Usuário cadastrado com sucesso! Faça o login.', 'sucesso_login')
        return redirect(url_for('index'))

    except mysql.connector.Error as erro:
        print(f"Erro ao cadastrar: {erro}")
        return f"Erro: O usuário '{novo_usuario}' já existe ou ocorreu um problema no banco."


# 5. ROTA PARA PAGINA MOVIMENTAÇÃO 
@app.route('/movimentacao', methods=['GET', 'POST'])
def tela_movimentar():
    if 'usuario_logado' not in session: return redirect(url_for('index'))
    try:
        conexao = obter_conexao()
        cursor = conexao.cursor()
        cursor.execute('SELECT Id, Nome, Quantidade FROM estoque')
        itens = cursor.fetchall()
        cursor.close()
        conexao.close()
        return render_template('movimentacao.html', itens=itens)
    except mysql.connector.Error as erro:
        return "Erro ao carregar itens", 500


@app.route('/salvar', methods=['POST'])
def salvar():
    if 'usuario_logado' not in session: return redirect(url_for('index'))
    
    id = request.form.get('id_item')
    opcao = request.form.get('tipo')
    qtde = int(request.form.get('quantidade'))
    
    conexao = obter_conexao()
    cursor = conexao.cursor()
    cursor.execute ('SELECT Quantidade FROM estoque WHERE id = %s', (id,))
    
    qtde_banco = cursor.fetchone()

    if opcao == 'entrada':
        qtde_atualizada = qtde_banco[0] + qtde
        cursor.execute('UPDATE estoque SET Quantidade = %s WHERE id = %s', (qtde_atualizada, id,))
    
    elif opcao == 'saida':
        qtde_atualizada = qtde_banco[0] - qtde
        cursor.execute('UPDATE estoque SET Quantidade = %s WHERE id = %s', (qtde_atualizada, id,))

    conexao.commit() # Adicionado commit para salvar a alteração da quantidade
    cursor.close()
    conexao.close()
    
    return redirect(url_for('banco'))
        
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
