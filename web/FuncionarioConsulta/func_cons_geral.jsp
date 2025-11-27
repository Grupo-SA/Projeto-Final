<%-- 
    Document   : func_cons_geral
    Created on : 26 de nov. de 2025, 14:46:32
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Funcionario" %>
<%@page import="model.DAO.FuncionarioDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta Geral</title>
    </head>
    <body>
        <h2>Consulta da Turma de Atiradores do Ano Corrente</h2>
        
        <%
            
            
            // Instânciando Objeto
            //Consulta geral de todos os atiradores
            FuncionarioDAO funcDAO = new FuncionarioDAO();
            List<Funcionario> lista = funcDAO.consultar_geral();
            if  (funcDAO.consultar_geral()== null){
                out.println("Turma não cadastrada!");
                
            }else{
                //saida
                out.println("<br> <b>Número | Nome | Cargo | RG </b> </br>");
                for(int i=0; i<=lista.size()-1 ;i++){
                    out.println( lista.get(i).getNumero()+ " | " + lista.get(i).getNome()+ " | " +lista.get(i).getCargo()+" | " +lista.get(i).getRG()+"<br>");
                }
            }
                    
        %>
        
        <br><a href="../IndexMenuFuncionario.html">Menu Funcionários</a></br>
        <br><a href="../index.html">Menu Principal</a></br>
    </body>
</html>
