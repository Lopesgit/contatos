<?php

require 'connection.php';

$output = null;

if($_REQUEST['action'] == "SELECT"){
    
    $aColumns = array( 'pessoa_nome', 'id_filial', 'id_depto', 'pessoa_email', 'pessoa_ramal', 'pessoa_ramaldireto', 
                        'pessoa_celulartim', 'pessoa_nextel', 'idstatus');

    /* DB table to use */
    $sTable = "pessoas p";
    
    $sInner = " INNER JOIN
                    filiais f ON f.id_filial = p.pessoa_filial
                INNER JOIN
                    deptos d ON d.id_depto = p.pessoa_depto
                INNER JOIN
                    status s ON s.idstatus = p.pessoa_status ";
    $sWhere = "WHERE p.id_pessoa = {$_REQUEST['id']}";
    
    $sQuery = "
            SELECT SQL_CALC_FOUND_ROWS `".str_replace(" , ", " ", implode("`, `", $aColumns))."`
            FROM   $sTable
            $sInner    
            $sWhere
            ";

    $rResult = $gaSql['link']->query($sQuery) or fatal_error( 'MySQL Error: ' . $gaSql['link']->connect_errno);
    
    while ( $aRow = mysqli_fetch_array( $rResult ) )
    {
            $row = array();
            for ( $i=0 ; $i<count($aColumns) ; $i++ )
            {
                    if ( $aColumns[$i] != ' ' )
                    {      
                        $row[$aColumns[$i]] = $aRow[ $aColumns[$i] ];                      
                            
                    }
            }
            $output = $row;
    }  
}

if($_REQUEST['action'] == "UPDATE"){
    
    if($_REQUEST['ramal'] != ""){
        $ramal = $_REQUEST['ramal'];      
    } else {
        $ramal = "-";
    }
    
    if($_REQUEST['ramal_direto'] != ""){
        $ramal_direto = $_REQUEST['ramal_direto'];     
    } else {
        $ramal_direto = "-";
    }
    
    if($_REQUEST['cel_tim'] != ""){
        $cel_tim = $_REQUEST['cel_tim'];    
    } else {
        $cel_tim = "-";
    }
    
    if($_REQUEST['nextel'] != ""){
        $nextel = $_REQUEST['nextel'];    
    } else {
        $nextel = "-";
    }
    
    $aFields =  "`pessoa_nome` =  '".utf8_decode($_REQUEST['nome'])."' , `pessoa_filial` =   {$_REQUEST['filial']}, `pessoa_depto` = {$_REQUEST['depto']}, 
                        `pessoa_email` =  '".utf8_decode($_REQUEST['email'])."' , `pessoa_ramal` = '{$ramal}', `pessoa_ramaldireto` = '{$ramal_direto}', 
                        `pessoa_celulartim`  = '{$cel_tim}', `pessoa_nextel` = '{$nextel}', 
                        `pessoa_status`  = {$_REQUEST['status']}";
    
    $sWhere = "WHERE `id_pessoa` = {$_REQUEST['id']}";
    $sTable = "pessoas";
    $sQuery = "
            UPDATE $sTable 
            SET $aFields
            $sWhere
            ";
    $rResult = $gaSql['link']->query($sQuery) or fatal_error( 'MySQL Error: ' . $gaSql['link']->connect_errno);
    
    $output = $rResult; 
}

if($_REQUEST['action'] == "INSERT"){
    
    if($_REQUEST['ramal'] != ""){
        $ramal = $_REQUEST['ramal'];      
    } else {
        $ramal = "-";
    }
    
    if($_REQUEST['ramal_direto'] != ""){
        $ramal_direto = $_REQUEST['ramal_direto'];     
    } else {
        $ramal_direto = "-";
    }
    
    if($_REQUEST['cel_tim'] != ""){
        $cel_tim = $_REQUEST['cel_tim'];    
    } else {
        $cel_tim = "-";
    }
    
    if($_REQUEST['nextel'] != ""){
        $nextel = $_REQUEST['nextel'];    
    } else {
        $nextel = "-";
    }
    
    $aFields = array( 'pessoa_nome', 'pessoa_filial', 'pessoa_depto', 'pessoa_email', 'pessoa_ramal', 'pessoa_ramaldireto', 
                        'pessoa_celulartim', 'pessoa_nextel');
    
    $aValues =  "'".utf8_decode($_REQUEST['nome'])."' ,{$_REQUEST['filial']}, {$_REQUEST['depto']}, 
                        '".utf8_decode($_REQUEST['email'])."' ,'{$ramal}', '{$ramal_direto}', 
                        '{$cel_tim}',  '{$nextel}'";
    $sTable = "pessoas";
    $sQuery = "
            INSERT INTO $sTable 
            (`".str_replace(" , ", " ", implode("`, `", $aFields))."`)
            VALUES ($aValues)
            ";
//    die($sQuery);
    $rResult = $gaSql['link']->query($sQuery) or fatal_error( 'MySQL Error: ' . $gaSql['link']->connect_errno);
    
    $output = $rResult; 
}


if($_REQUEST['action'] == "DELETE"){
    
    $sWhere = "WHERE `id_pessoa` = {$_REQUEST['id']}";    
    
    $sTable = "pessoas";
    
    $sQuery = "
            DELETE FROM $sTable 
            $sWhere
            ";
    $rResult = $gaSql['link']->query($sQuery) or fatal_error( 'MySQL Error: ' . $gaSql['link']->connect_errno);
}

$gaSql['link']->close();
echo json_encode( $output );




