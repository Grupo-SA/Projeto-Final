<%-- 
    Document   : Func_ConsNometoAlt
    Created on : 26 de nov. de 2025, 18:27:21
    Author     : felip
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Funcionario"%>
<%@page import="model.DAO.FuncionarioDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Funcionário</title>
    </head>
    <body>

        <h1>Consulta para Alteração de Funcionário</h1>

        <%
            // 1. Recebe o nome que veio da pesquisa anterior (input name="nome")
            String nomePesquisa = request.getParameter("nome");
            
            // Instancia o DAO e a Lista
            FuncionarioDAO funcDAO = new FuncionarioDAO();
            List<Funcionario> lista = null;
            
            // Só tenta buscar se o nome não estiver vazio
            if (nomePesquisa != null && !nomePesquisa.isEmpty()) {
                // IMPORTANTE: Certifique-se de que existe o método "consultar_nome" no FuncionarioDAO
                lista = funcDAO.consultar_nome(nomePesquisa);
            }

            Funcionario func = null;

            // Verifica se encontrou alguém
            if (lista != null && !lista.isEmpty()) {
                func = lista.get(0); // Pega o primeiro encontrado
            }

            // Lógica de Exibição
            if (func == null) {
                if (nomePesquisa != null) {
                    out.println("<p style='color:red'>Funcionário não encontrado com o nome: " + nomePesquisa + "</p>");
                }
        %>
                <form method="post" action="Func_alt.jsp">
                    <p>Digite o nome para buscar: <input type="text" name="nome"></p>
                    <input type="submit" value="Buscar">
                </form>
        <%
            } else {
                // SE ENCONTROU, MOSTRA O FORMULÁRIO JÁ PREENCHIDO PARA EDITAR
        %>
        
            <form method="post" action="Func_Alt.jsp"> 
                
                <input type="hidden" name="Numero" value="<%=func.getNumero()%>">
                
                <p>Nome: <input type="text" name="nome" value="<%=func.getNome()%>"></p>
                <p>Cargo: <input type="text" name="cargo" value="<%=func.getCargo()%>"></p>
                <p>RG: <input type="text" name="RG" value="<%=func.getRG()%>"></p>
                
                <input type="submit" value="Salvar Alterações">
            </form>
            
            <br>
            <a href="Index_alt_func.html">Nova Pesquisa</a>
        
        <%
            }
        %>
    </body>
</html>
