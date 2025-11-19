<%-- 
    Document   : cons_numAtrd
    Created on : 18 de nov. de 2025, 10:46:47
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1>Consulta de Atirador por numero</h1>
        <%
            List<Atirador> lista = new ArrayList();
            AtiradorDAO atrdDAO = new AtiradorDAO();
            lista = atrdDAO.consultar_numero(request.getParameter("Numero"));
            if(atrdDAO.consultar_geral()== null){
                out.println("Atirador não encontrado!");
            }else{
                out.println("<br> <b>Número | Nome | RG  </b> <br>");
                for (int i=0; i <= lista.size()-1;i++){
                    out.println( lista.get(i).getNumero()+ " | " + lista.get(i).getNome()+ " | " +lista.get(i).getRG()+"<br>");
                }
            }
       %>     
    </body>
</html>

