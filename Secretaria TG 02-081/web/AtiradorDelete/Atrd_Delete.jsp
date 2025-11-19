<%-- 
    Document   : Atrd_Delete
    Created on : 18 de nov. de 2025, 11:04:36
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Atirador"%>
<%@page import="model.DAO.AtiradorDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Atiradores</title>
    </head>
    <body>
        <h1>Remover Atirador</h1>
        <%
            // Instância do Objeto
            Atirador atrd = new Atirador();
            
            // Atrib. valores ao obj
            atrd.setNumero( Integer.parseInt(request.getParameter("Numero")));            
            
            //Excluir...
            AtiradorDAO atrdDAO = new AtiradorDAO();
            if (atrdDAO.excluir(atrd)){
                out.println("Atirador removido da turma com sucesso!");
            }else{
                out.println("Atirador não removido ou não encontrado!");
            }
        %>
        <br><a href="../index.html">Menu Principal</a></br>
    </body>
</html>
