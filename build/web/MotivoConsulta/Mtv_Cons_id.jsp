<%-- 
    Document   : Mtv_Cons_id
    Created on : 26 de nov. de 2025, 19:44:50
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
        <title>Página resultado</title>
    </head>
    <body>
        <h1>Consulta de Atirador por numero</h1>
        <%
            List<Motivo> lista = new ArrayList();
            MotivoDAO mtvDAO = new MotivoDAO();
            lista = mtvDAO.consultar_numero(request.getParameter("Numero"));
            if(mtvDAO.consultar_geral()== null){
                out.println("Atirador não encontrado!");
            }else{
                out.println("<br> <b>Número | Nome | RG  </b> <br>");
                for (int i=0; i <= lista.size()-1;i++){
                    out.println( lista.get(i).getNumero()+ " | " + lista.get(i).getMotivo()+ " | <br>");
                }
            }
       %>    
       
       <br><a href="../IndexMenuMotivo.html"></a></br>
        <br><a href="../index.html"></a></br>
    </body>
</html>

