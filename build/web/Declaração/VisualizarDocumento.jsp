<%-- 
    Document   : VisualizarDocumento
    Created on : 26 de nov. de 2025, 22:34:30
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Campos para preencher a declaração
    String nome = request.getParameter("nome");
    String rg = request.getParameter("rg");
    String dataGuarda = request.getParameter("dataGuarda");
    String dataAssinatura = request.getParameter("dataAssinatura");
    String motivo = request.getParameter("motivo");
    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String cargoFuncionario = request.getParameter("cargoFuncionario");
    
    // Converte para Maiúsculo para ficar bonito na assinatura
    if(nomeFuncionario != null) nomeFuncionario = nomeFuncionario.toUpperCase();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Declaração de Comparecimento</title>
        <style>
            /* Configuração da Página A4 */
            body {
                background: #ccc; /* Fundo cinza para destacar o papel na tela */
                margin: 0;
                font-family: "Times New Roman", Times, serif;
            }
            page {
                background: white;
                display: block;
                margin: 0 auto;
                margin-bottom: 0.5cm;
                box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
                
                /* Tamanho A4 Oficial */
                width: 21cm;
                height: 29.7cm; 
                padding: 2cm 2cm; /* Margens da folha */
                box-sizing: border-box;
            }
            
            /* Estilos do Texto */
            .center { text-align: center; }
            .justify { text-align: justify; line-height: 1.5; }
            .bold { font-weight: bold; }
            .upper { text-transform: uppercase; }
            
            .header { font-size: 12pt; font-weight: bold; margin-bottom: 50px; }
            .title { font-size: 14pt; font-weight: bold; margin-bottom: 40px; text-decoration: underline; }
            .content { font-size: 12pt; margin-bottom: 20px; }
            .signature { margin-top: 100px; }
            .footer { margin-top: 50px; font-size: 10pt; font-weight: bold; }
            
            /* Botão de Imprimir (Só aparece na tela) */
            .no-print {
                text-align: center;
                padding: 20px;
            }
            .btn-print {
                padding: 10px 20px; background: #003366; color: white; 
                border: none; cursor: pointer; font-size: 16px; border-radius: 5px;
            }

            /* Configuração ESPECIAL para Impressora */
            @media print {
                body, page {
                    margin: 0;
                    box-shadow: none;
                    background: white;
                }
                .no-print { display: none; } /* Esconde o botão ao imprimir */
            }
        </style>
    </head>
    <body>

        <div class="no-print">
            <button class="btn-print" onclick="window.print()">🖨️ Imprimir Declaração</button>
        </div>
          
        <!!<!-- Texto da declaração com pequenos comando JSP para preencher os campos necessários com personalização  -->
        <page>
            <div class="header center">
                <img src="brasao.png" width="80" height="80"><br>
                MINISTÉRIO DA DEFESA<br>
                EXÉRCITO BRASILEIRO<br>
                CMSE - CMDO 2ª RM<br>
                SEÇÃO DE TIROS-DE-GUERRA E ESCOLAS DE INSTRUÇÃO MILITAR<br>
                TIRO-DE-GUERRA 02-081 - SUZANO - SP / 4759-1385
            </div>

            <div class="title center">
                DECLARAÇÃO DE COMPARECIMENTO
            </div>

            <div class="content justify">
                <p>
                    Declaro para os devidos fins, que o senhor <span class="bold upper"><%= nome %></span>, 
                    Cédula de Identidade número <span class="bold"><%= rg %></span> SSP/SP, 
                    está matriculado neste Tiro de Guerra a partir de 07 de março de 2025, 
                    fins de Prestação do Serviço Militar Inicial, de acordo com o que prescreve o Art. 60 da Lei 4375, 
                    de 19 de agosto de 1964 (Lei do Serviço Militar) e Decreto-Lei nº 715 de 30 de Julho de 1969 
                    (Abono de Faltas) com licenciamento das Fileiras do Exército Brasileiro em 02 de Dezembro de 2025.
                </p>
                <p>
                    O atirador frequenta às instruções no horário das 5h às 8h, de segunda-feira a sábado. 
                    Excepcionalmente no dia <span class="bold"><%= dataGuarda %></span>, 
                    o militar precisou permanecer tempo excedente no quartel para fins de <%= motivo %>.
                </p>
                <p>
                    O referido atirador sempre que necessitar realizar manobras, exercícios de Tiro, 
                    campanhas comunitárias e serviço de escala, de acordo com a Lei de Serviço Militar, 
                    por estar matriculado neste Órgão de Formação da Reserva (Tiro de Guerra), 
                    sendo obrigado a faltar às suas atividades civis, terá suas faltas abonadas, para todos os efeitos.
                </p>
            </div>

            <div class="content center" style="margin-top: 50px;">
                Suzano, <%= dataAssinatura %>.
            </div>

            <div class="signature center">
                __________________________________________________<br>
                <span class="bold"><%= nomeFuncionario %></span><br>
                <%= cargoFuncionario %>
            </div>

            <div class="footer center">
                "OITENTA ANOS DAS VITÓRIAS DA FORÇA EXPEDICIONÁRIA BRASILEIRA.<br>
                HERÓIS SEMPRE LEMBRADOS!"
            </div>
        </page>

    </body>
</html>
