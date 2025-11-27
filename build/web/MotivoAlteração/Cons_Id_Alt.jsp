<%-- 
    Document   : Cons_Id_Alt
    Created on : 26 de nov. de 2025, 19:54:55
    Author     : felip
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Motivo"%>
<%@page import="model.DAO.MotivoDAO"%>


        <h1>Consulta para Alteração</h1>
        
        <%
            // Instanciando Objeto DAO
            MotivoDAO mtvDAO = new MotivoDAO();    
            String numeroStr = request.getParameter("numero"); 
            
            //Atribui o resultado a uma Lista.
            List listaMotivo = mtvDAO.consultar_numero(numeroStr); 
            
            //Declara o objeto atrd antes.
            Motivo mtv = null;
            
            //Verifica se a lista não é nula E se tem pelo menos um elemento.
            if (listaMotivo != null && !listaMotivo.isEmpty()) {
                mtv = (Motivo) listaMotivo.get(0); // Pega o primeiro objeto Atirador da lista.
            }

            //A verificação usa o objeto atrd (que é nulo se não encontrado)

            if (mtv == null) { 
                out.println("Motivo Não encontrado");
            } else {
                
        %>
             
        <!<!--Formulário de entrada para aletrar o cadastro -->
        <form method="post" action="Mtv_Alt.jsp"> 
            <input type="hidden" name="Numero" readyonly="true" value="<%=mtv.getNumero()%>">
            <p>Motivo: <input type="text" name="Motivo" value="<%=mtv.getMotivo()%>"></p>
            
            <input type="submit" value="Alterar">
        </form>

        

        <%
            }
        %>
    </body>

</html>
