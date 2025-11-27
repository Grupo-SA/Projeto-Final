<%-- 
    Document   : Atrd_ConsbyIDtoAltr
    Created on : 18 de nov. de 2025, 15:15:08
    Author     : felip
--%>

<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="model.Atirador"%>

<%@page import="model.DAO.AtiradorDAO"%>







        <h1>Consulta para Alteração</h1>

        <%

            // Instanciando Objeto DAO
            AtiradorDAO atrdDAO = new AtiradorDAO();    
            String numeroStr = request.getParameter("numero"); 


            //Atribui o resultado a uma Lista.
            List listaAtiradores = atrdDAO.consultar_numero(numeroStr); 



            //Declara o objeto atrd antes.
            Atirador atrd = null;



            //Verifica se a lista não é nula E se tem pelo menos um elemento.
            if (listaAtiradores != null && !listaAtiradores.isEmpty()) {

                atrd = (Atirador) listaAtiradores.get(0); // Pega o primeiro objeto Atirador da lista.

            }



            //A verificação usa o objeto atrd (que é nulo se não encontrado)

            if (atrd == null) { 

                out.println("Atirador Não encontrado");

            } else {

                

        %>

        

        

        <!<!--Formulário de entrada para aletrar o cadastro -->

        <form method="post" action="Atrd_Alt.jsp"> 

            <input type="hidden" name="Numero" readyonly="true" value="<%=atrd.getNumero()%>">

            <p>Nome do Atirador: <input type="text" name="nome" value="<%=atrd.getNome()%>"></p>

            <p>RG do Atirador: <input type="text" name="RG" value="<%=atrd.getRG()%>"></p>

            <input type="submit" value="Alterar">

        </form>

        

        <%

            }

        %>

    </body>

</html>