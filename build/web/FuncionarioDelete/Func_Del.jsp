<%-- 
    Document   : Func_Del
    Created on : 26 de nov. de 2025, 15:42:16
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Funcionario"%>
<%@page import="model.DAO.FuncionarioDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Funcionário</title>
    </head>
    <body>
        <h1>Remover Atirador</h1>
        <%
            // Instância do Objeto
            Funcionario func = new Funcionario();
            
            // Atrib. valores ao obj
            func.setNome(request.getParameter("Nome"));            
            
            //Excluir...
            FuncionarioDAO funcDAO = new FuncionarioDAO();
            if (funcDAO.excluir(func)){
                out.println("Funcionario removido com sucesso!");
            }else{
                out.println("Funcionário não removido ou não encontrado!");
            }
        %>
        
        <br><a href="../IndexMenuFuncionario.html">Menu Funcionários</a></br>
        <br><a href="../index.html">Menu Principal</a></br>
        
    </body>
</html>
