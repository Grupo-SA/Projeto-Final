<%-- 
    Document   : Func_cad
    Created on : 26 de nov. de 2025, 12:47:22
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Funcionario"%>
<%@page import="model.DAO.FuncionarioDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Controle de Funcionário</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    
    <body>
        <h1>Cadastro de Funcionários</h1>
        <% 
            //Instanciando objeto
            Funcionario func = new Funcionario();
            
            //atribuindo valores ao abjeto
            
            func.setNome ( request.getParameter("nome"));
            
            func.setCargo(request.getParameter("cargo"));
            
            func.setRG(request.getParameter ("RG"));
            
            //Gravando dados
            FuncionarioDAO funcDAO = new FuncionarioDAO();
            if (funcDAO.cadastrar (func)){
                out.println("Atirador Cadastrado com sucesso!!");
                
                //saída
                out.println("<br> <b>Nome Funcionário<b> </br>" + func.getNome());
                out.println("<br> <b>Cargo do Funcionário<b> </br>" + func.getCargo());
                out.println("<br> <b>RG do Funcionário<b> </br>" + func.getRG());
            }else{
                out.println("FUncionário não cadastrado!!");
            }
            
            
            
        %>
        
        <br><a href="../IndexMenuFuncionario.html">Menu Funcionários</a></br>
        <br><a href="../index.html">Menu Principal</a></br>
    </body>
</html>
