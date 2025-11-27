<%-- 
    Document   : Cons_nome_func
    Created on : 26 de nov. de 2025, 14:56:00
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*" %>
<%@page import="model.Funcionario" %>
<%@page import="model.DAO.FuncionarioDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página resultado</title>
    </head>
    <body>
        <h1>Consulta de Funcionários por nome</h1>
        <%
           // cons_nomeatrd.jsp

            List<Funcionario> lista = new ArrayList();
            FuncionarioDAO funcDAO = new FuncionarioDAO();
            // Consulta: 'lista' será null se nada for encontrado
            lista = funcDAO.consultar_nome(request.getParameter("nome"));
            
            // CORREÇÃO: Verifica se a 'lista' está nula OU se está vazia.
            if(lista == null || lista.isEmpty()){ 
                out.println("Funcionario não encontrado!");
            }else{
                out.println("<br> <b>Número | Nome | Cargo | RG </b> <br>");
                // O loop for é seguro, pois já verificamos que lista não é nula
                for (int i=0; i <= lista.size()-1;i++){
                    out.println( lista.get(i).getNumero()+ " | " + lista.get(i).getNome()+ " | " + lista.get(i).getCargo()+" | " +lista.get(i).getRG()+"<br>");
                }
            }
       %> 
       
       <br><a href="../IndexMenuFuncionario.html">Menu Funcionários</a></br>
        <br><a href="../index.html">Menu Principal</a></br>
    </body>
</html>
