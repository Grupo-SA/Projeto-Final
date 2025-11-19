<%-- 
    Document   : atrd_cons_geral
    Created on : 15 de nov. de 2025, 10:29:46
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
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Consulta da Turma de Atiradores do Ano Corrente</h2>
        
        <%
            
            
            // Instânciando Objeto
            //Consulta geral de todos os atiradores
            AtiradorDAO atrdDAO = new AtiradorDAO();
            List<Atirador> lista = atrdDAO.consultar_geral();
            if  (atrdDAO.consultar_geral()== null){
                out.println("Turma não cadastrada!");
                
            }else{
                //saida
                out.println("<br> <b>Número | Nome | RG </b> </br>");
                for(int i=0; i<=lista.size()-1 ;i++){
                    out.println( lista.get(i).getNumero()+ " | " + lista.get(i).getNome()+ " | " +lista.get(i).getRG()+"<br>");
                }
            }
                    
        %>
    </body>
</html>
