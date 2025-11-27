<%-- 
    Document   : EmitirDeclaração
    Created on : 26 de nov. de 2025, 22:34:03
    Author     : felip
--%>

<%@page import="model.Funcionario"%>
<%@page import="model.DAO.FuncionarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Atirador"%>
<%@page import="model.DAO.AtiradorDAO"%>
<%@page import="model.Motivo"%>
<%@page import="model.DAO.MotivoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Emitir Declaração</title>
        <style>
            body { font-family: Arial; padding: 20px; background-color: #f4f4f4; }
            .form-box { max-width: 600px; margin: 0 auto; border: 1px solid #ccc; padding: 20px; background: white; box-shadow: 2px 2px 10px rgba(0,0,0,0.1); }
            label { font-weight: bold; display: block; margin-top: 10px; }
            select, input { width: 100%; margin-bottom: 10px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
            input[readonly] { background-color: #e9e9e9; color: #555; cursor: not-allowed; }
            button { background: green; color: white; padding: 10px; width: 100%; border: none; cursor: pointer; font-size: 16px; border-radius: 4px; margin-top: 20px; }
        </style>
        
        <script>
            // 1. Função para o ATIRADOR (RG)
            function atualizarRG() {
                var select = document.getElementById("selectAtirador");
                var opcaoSelecionada = select.options[select.selectedIndex];
                var rg = opcaoSelecionada.getAttribute("data-rg");
                document.getElementById("campoRG").value = rg;
            }

            // 2. NOVA Função para o FUNCIONÁRIO (Cargo)
            function atualizarCargo() {
                var select = document.getElementById("selectFuncionario");
                var opcao = select.options[select.selectedIndex];
                var cargo = opcao.getAttribute("data-cargo");
                
                // Joga o cargo num campo escondido (Hidden) 
                document.getElementById("campoCargo").value = cargo;
            }
        </script>
    </head>
    <body>
        <div class="form-box">
            <h2 style="text-align: center;">Emitir Declaração</h2>
            
            <form action="VisualizarDocumento.jsp" method="POST">
                
                <!!<!-- Menu suspenso com os atiradores cadastrados no sistema -->
                <label>Selecione o Atirador:</label>
                <select name="nome" id="selectAtirador" onchange="atualizarRG()" required>
                    <option value="">-- Selecione --</option>
                    <%
                        AtiradorDAO atrdDAO = new AtiradorDAO();
                        List<Atirador> listaAtrd = atrdDAO.consultar_geral();
                        if (listaAtrd != null) {
                            for (Atirador a : listaAtrd) {
                    %>
                        <option value="<%= a.getNome() %>" data-rg="<%= a.getRG() %>"><%= a.getNome() %></option>
                    <%  } } %>
                </select>
                
                <!!<!-- RG se preenche sozinho tendo como referência o nome do atirador -->
                <label>RG:</label>
                <input type="text" name="rg" id="campoRG" readonly placeholder="Automático...">

                <!!<!-- Escolha do funcionário do tiro de guerra que vai assinar-->
                <hr> <label>Quem vai assinar (Funcionário):</label>
                <select name="nomeFuncionario" id="selectFuncionario" onchange="atualizarCargo()" required>
                    <option value="">-- Selecione o Chefe/Oficial --</option>
                    <%
                        FuncionarioDAO funcDAO = new FuncionarioDAO();
                        // Lista todos os funcionários
                        List<Funcionario> listaFunc = funcDAO.consultar_geral();
                        if (listaFunc != null) {
                            for (Funcionario f : listaFunc) {
                    %>
                        <option value="<%= f.getNome() %>" data-cargo="<%= f.getCargo() %>">
                            <%= f.getNome() %>
                        </option>
                    <%  } } %>
                </select>

                <input type="hidden" name="cargoFuncionario" id="campoCargo">

                <hr>
                <label>Motivo do Comparecimento (para fins de...):</label>
                <select name="motivo" required>
                    <option value="">-- Selecione o Motivo --</option>
                    <%
                        MotivoDAO mtvDAO = new MotivoDAO();
                        List<Motivo> listaMtv = mtvDAO.consultar_geral();
                        
                        if (listaMtv != null) {
                            for (Motivo m : listaMtv) {
                    %>
                        <option value="<%= m.getMotivo() %>">
                            <%= m.getMotivo() %>
                        </option>
                    <%
                            }
                        }
                    %>
                </select>

                <label>Data do Comparecimento:</label>
                <input type="text" name="dataGuarda" required placeholder="Ex: 08 de JULHO de 2025">
                
                <label>Data da Assinatura:</label>
                <input type="text" name="dataAssinatura" required placeholder="Ex: 09 de JULHO de 2025">
                
                <button type="submit">Gerar Documento</button>
            </form>
        </div>
    </body>
</html>