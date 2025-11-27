<%-- 
    Document   : atirador
    Created on : 14 de nov. de 2025, 21:08:59
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Atirador"%>
<%@page import="model.DAO.AtiradorDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Controle de Atiradores</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    
    <body>
        <h1>Cadastro de Atiradores</h1>
        <% 
            //Instanciando objeto
            Atirador atrd = new Atirador();
            
            //atribuindo valores ao abjeto
            
            atrd.setNome ( request.getParameter("nome"));
            atrd.setRG(request.getParameter ("RG"));
            
            //Gravando dados
            AtiradorDAO atrdDAO = new AtiradorDAO();
            if (atrdDAO.cadastrar (atrd)){
                out.println("Atirador Cadastrado com sucesso!!");
                
                //saída
                out.println("<br> <b>nome do Atirador<b> </br>" + atrd.getNome());
                out.println("<br> <b>RG do Atirador<b> </br>" + atrd.getRG());
            }else{
                out.println("Atirador não cadastrado!!");
            }
            
            
            
        %>
        <br> <a href="../IndexMenuAtirador.html">Menu Atiradores</a></br>
        <br><a href="../index.html">Menu Principal</a></br>
    </body>
</html>
