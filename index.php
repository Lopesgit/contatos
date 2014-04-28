<?php
header ('Content-type: text/html; charset=UTF-8');

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
<html>
    <head>
        <title>Contatos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="./css/buttons.css"/>
        <link rel="stylesheet" type="text/css" href="./css/form_index.css"/>
        <link rel="stylesheet" type="text/css" href="./css/jquery.dataTables_themeroller.css"/>
        <link rel="stylesheet" type="text/css" href="./css/blitzer/jquery-ui-1.10.4.custom.min.css"/>
        <link rel="stylesheet" type="text/css" href="./css/jquery.tooltip.css"/>
        <script type="text/javascript" charset="utf-8" src="./js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" charset="iso-8859-1" src="./js/index.js"></script>
        <script type="text/javascript" charset="utf-8" src="./js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="./js/jquery.tooltip.js"></script>
        <script type="text/javascript" charset="utf-8" src="./js/jquery-ui-1.10.4.custom.min.js"></script>  
    </head>
    <body class="ex_highlight_row">
        <div id="form_container" style="background-image: ">
            <div class="form_description">
                <div id="div_img">                    
                    <h2>Telefones, Ramais e E-mail</h2>
                    <p>Lista de contatos da Flecha de Prata.</p>
                </div>           
            </div>
            <div id="demo" class="div-right">
                <table id="tb_func" class="display" cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th class="large-text">Nome</th>
                            <th class="med-text">Filial</th>
                            <th class="med-text">Departamento</th>
                            <th class="large-text">E-mail</th>
                            <th class="short-num">Ramal</th>
                            <th class="med-num">Ramal Direto</th>
                            <th class="med-num">Celular Tim</th>
                            <th class="med-num">Nextel</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                    <tfoot>
                        <tr>
                            <th class="med-text">Nome</th>
                            <th class="short-text">Filial</th>
                            <th class="short-text">Departamento</th>
                            <th class="med-text">E-mail</th>
                            <th class="short-num">Ramal</th>
                            <th class="med-num">Ramal Direto</th>
                            <th class="med-num">Celular Tim</th>
                            <th class="med-num">Nextel</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>  
    </body>
</html>

