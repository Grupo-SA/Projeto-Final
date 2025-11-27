<%-- 
    Document   : Mtv_Alt
    Created on : 26 de nov. de 2025, 19:56:08
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Motivo"%>
<%@page import="model.DAO.MotivoDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualização de Motivo</title>
    </head>
    <body>
        <h1>Motivo Atualizado!!</h1>
        <% 
            Motivo mtv = new Motivo();
            String numeroStr = request.getParameter("Numero");
            mtv.setNumero(Integer.parseInt(numeroStr));
            mtv.setMotivo(request.getParameter("Motivo"));
            
            
            MotivoDAO mtvDAO = new MotivoDAO();
            if (mtvDAO.alterar(mtv)){
                out.println("O cadastro de motivo foi Atualizado com sucesso");
                //Saída
                out.println("<br><br> <b>Número do motivo: </b>" + mtv.getNumero());
                out.println("<br> <b>Motivo......: </b>" + mtv.getMotivo());
                
                
            }else{
                out.println("Motivo não alterado!!!");
            }
        %>
        
        <br><a href="../IndexMenuMotivo.html"></a></br>
        <br><a href="../index.html"></a></br>
    </body>
</html>