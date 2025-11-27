<%-- 
    Document   : Atrd_Alt
    Created on : 18 de nov. de 2025, 15:46:46
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Atirador"%>
<%@page import="model.DAO.AtiradorDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro Atualizado!!</h1>
        <% 
            Atirador atrd= new Atirador();
            String numeroStr = request.getParameter("Numero");
            atrd.setNumero(Integer.parseInt(numeroStr));
            atrd.setNome(request.getParameter("nome"));
            atrd.setRG( request.getParameter("RG"));
            
            AtiradorDAO atrdDAO = new AtiradorDAO();
            if (atrdDAO.alterar(atrd)){
                out.println("O cadastro do atirador foi Atualizado com sucesso");
                //Saída
                out.println("<br><br> <b>Número do Atirador: </b>" + atrd.getNumero());
                out.println("<br> <b>Nome do Atirador......: </b>" + atrd.getNome());
                out.println("<br> <b>RG ......: </b>" + atrd.getRG());
                
            }else{
                out.println("Produto não alterado!!!");
            }
        %>
        
        <p><a href="../IndexMenuAtirador.html">Menu Principal</a></p>
    </body>
</html>
