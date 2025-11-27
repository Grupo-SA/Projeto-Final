<%-- 
    Document   : Func_Alt
    Created on : 26 de nov. de 2025, 18:00:58
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Funcionario"%>
<%@page import="model.DAO.FuncionarioDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Cadastro de Funcionário</title>
    </head>
    <body>
        <h1>Cadastro Atualizado!!</h1>
        <% 
            Funcionario func= new Funcionario();
            String numeroStr = request.getParameter("Numero");
            func.setNumero(Integer.parseInt(numeroStr));
            func.setNome(request.getParameter("nome"));
            func.setCargo(request.getParameter("cargo"));
            func.setRG( request.getParameter("RG"));
            
            FuncionarioDAO funcDAO = new FuncionarioDAO();
            if (funcDAO.alterar(func)){
                out.println("O cadastro do funcionário foi Atualizado com sucesso");
                //Saída
                out.println("<br><br> <b>Número do Funcionário: </b>" + func.getNumero());
                out.println("<br> <b>Nome do Funcionário......: </b>" + func.getNome());
                out.println("<br> <b>Cargo do Funcionário......: </b>" + func.getCargo());
                out.println("<br> <b>RG ......: </b>" + func.getRG());
                
            }else{
                out.println("Produto não alterado!!!");
            }
        %>
        
        <br><a href="../IndexMenuFuncionario.html">Menu Funcionários</a></br>
        <br><a href="../index.html">Menu Principal</a></br>
        
        
    </body>
</html>

