<%-- 
    Document   : Mtv_cons
    Created on : 26 de nov. de 2025, 19:45:10
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Motivo" %>
<%@page import="model.DAO.MotivoDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Motivos</title>
    </head>
    <body>
        <h2>Consulta de motivos para declaração</h2>
        
        <% 
            // Instânciando Objeto
            //Consulta geral de todos os atiradores
            MotivoDAO mtvDAO = new MotivoDAO();
            List<Motivo> lista = mtvDAO.consultar_geral();
            if  (mtvDAO.consultar_geral()== null){
                out.println("Motivo não cadastrado!");
                
            }else{
                //saida
                out.println("<br> <b>Número | Motivo</b> </br>");
                for(int i=0; i<=lista.size()-1 ;i++){
                    out.println( lista.get(i).getNumero()+ " | " + lista.get(i).getMotivo()+ " | ");
                }
            }
                    
        %>
        
        <br><a href="../IndexMenuMotivo.html"></a></br>
        <br><a href="../index.html"></a></br>
    </body>
</html>
