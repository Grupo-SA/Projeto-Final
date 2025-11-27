<%-- 
    Document   : Mtv_Del
    Created on : 26 de nov. de 2025, 19:54:12
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Motivo"%>
<%@page import="model.DAO.MotivoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Motivos</title>
    </head>
    <body>
        <h1>Remover Atirador</h1>
        <%
            // Instância do Objeto
            Motivo mtv = new Motivo();
            
            // Atrib. valores ao obj
            mtv.setNumero( Integer.parseInt(request.getParameter("Numero")));            
            
            //Excluir...
            MotivoDAO mtvDAO = new MotivoDAO();
            if (mtvDAO.excluir(mtv)){
                out.println("Motivo removido com sucesso!");
            }else{
                out.println("Motivo não removido ou não encontrado!");
            }
        %>
        
        <br><a href="../IndexMenuMotivo.html"></a></br>
        <br><a href="../index.html"></a></br>
        
    </body>
</html>
