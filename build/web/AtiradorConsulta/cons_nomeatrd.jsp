<%-- 
    Document   : cons_nomeatrd
    Created on : 18 de nov. de 2025, 07:29:27
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*" %>
<%@page import="model.Atirador" %>
<%@page import="model.DAO.AtiradorDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página resultado</title>
    </head>
    <body>
        <h1>Consulta de Atirador por nome</h1>
        <%
           // cons_nomeatrd.jsp

            List<Atirador> lista = new ArrayList();
            AtiradorDAO atrdDAO = new AtiradorDAO();
            // Consulta: 'lista' será null se nada for encontrado
            lista = atrdDAO.consultar_nome(request.getParameter("nome"));
            
            // CORREÇÃO: Verifica se a 'lista' está nula OU se está vazia.
            if(lista == null || lista.isEmpty()){ 
                out.println("Atirador não encontrado!");
            }else{
                out.println("<br> <b>Número | Nome | RG </b> <br>");
                // O loop for é seguro, pois já verificamos que lista não é nula
                for (int i=0; i <= lista.size()-1;i++){
                    out.println( lista.get(i).getNumero()+ " | " + lista.get(i).getNome()+ " | " +lista.get(i).getRG()+"<br>");
                }
            }
       %>    
       
       <br> <a href="../IndexMenuAtirador.html">Menu Atiradores</a></br>
        <br><a href="../index.html">Menu Principal</a></br>
    </body>
</html>
