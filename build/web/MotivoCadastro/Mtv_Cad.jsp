<%-- 
    Document   : Mtv_Cad
    Created on : 26 de nov. de 2025, 19:43:34
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Motivo"%>
<%@page import="model.DAO.MotivoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Controle de declarações</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    
    <body>
        <h1>Cadastro de Motivos</h1>
        <% 
            //Instanciando objeto
            Motivo mtv= new Motivo();
            
            //atribuindo valores ao abjeto
            
            mtv.setMotivo ( request.getParameter("Motivo"));
            
            
            //Gravando dados
            MotivoDAO mtvDAO = new MotivoDAO();
            if (mtvDAO.cadastrar (mtv)){
                out.println("Motivo Cadastrado com sucesso!!");
                
                //saída
                out.println("<br> <b>Motivo:<b> </br>" + mtv.getMotivo());
                
            }else{
                out.println("Motivo não cadastrado!!");
            }
            
            
            
        %>
        
        <br><a href="../IndexMenuMotivo.html"></a></br>
        <br><a href="../index.html"></a></br>
    </body>
</html>