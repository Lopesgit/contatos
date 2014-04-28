<?php
header ('Content-type: text/html; charset=UTF-8');
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * Easy set variables
     */

    /* Array of database columns which should be read and sent back to DataTables. Use a space where
     * you want to insert a non-database field (for example a counter or static image)
     */
    $aColumns = array('pessoa_nome', 'filial_nome', 'depto_nome', 'pessoa_email', 'pessoa_ramal', 
                        'pessoa_ramaldireto', 'pessoa_celulartim', 'pessoa_nextel', 'status_desc');

    /* Indexed column (used for fast and accurate table cardinality) */
    $sIndexColumn = "id_pessoa";

    /* DB table to use */
    $sTable = "pessoas p";
    
    $sInner = " INNER JOIN
                    filiais f ON f.id_filial = p.pessoa_filial
                INNER JOIN
                    deptos d ON d.id_depto = p.pessoa_depto
                INNER JOIN
                    status s ON s.idstatus = p.pessoa_status ";

    /* Database connection information */
    require 'connection.php';


    /* 
     * Paging
     */
    $sLimit = "";
    if ( isset( $_GET['iDisplayStart'] ) && $_GET['iDisplayLength'] != '-1' )
    {
            $sLimit = "LIMIT ".intval( $_GET['iDisplayStart'] ).", ".
                    intval( $_GET['iDisplayLength'] );
    }


    /*
     * Ordering
     */
    $sOrder = "";
    if ( isset( $_GET['iSortCol_0'] ) )
    {
            $sOrder = "ORDER BY  ";
            for ( $i=0 ; $i<intval( $_GET['iSortingCols'] ) ; $i++ )
            {
                    if ( $_GET[ 'bSortable_'.intval($_GET['iSortCol_'.$i]) ] == "true" )
                    {
                            $sOrder .= "`".$aColumns[ intval( $_GET['iSortCol_'.$i] ) ]."` ".
                                    ($_GET['sSortDir_'.$i]==='asc' ? 'asc' : 'desc') .", ";
                    }
            }

            $sOrder = substr_replace( $sOrder, "", -2 );
            if ( $sOrder == "ORDER BY" )
            {
                    $sOrder = "";
            }
    }


    /* 
     * Filtering
     * NOTE this does not match the built-in DataTables filtering which does it
     * word by word on any field. It's possible to do here, but concerned about efficiency
     * on very large tables, and MySQL's regex functionality is very limited
     */
    $sWhere = "";
    if ( isset($_GET['sSearch']) && $_GET['sSearch'] != "" )
    {
            $sWhere = "WHERE (";
            for ( $i=0 ; $i<count($aColumns) ; $i++ )
            {
                    $sWhere .= "`".$aColumns[$i]."` LIKE '%".utf8_decode($gaSql['link']->real_escape_string( $_GET['sSearch'] ))."%' OR ";
            }
            $sWhere = substr_replace( $sWhere, "", -3 );
            $sWhere .= ')';
    }

    /* Individual column filtering */
    for ( $i=0 ; $i<count($aColumns) ; $i++ )
    {
            if ( isset($_GET['bSearchable_'.$i]) && $_GET['bSearchable_'.$i] == "true" && $_GET['sSearch_'.$i] != '' )
            {
                    if ( $sWhere == "" )
                    {
                            $sWhere = "WHERE ";
                    }
                    else
                    {
                            $sWhere .= " AND ";
                    }
                    $sWhere .= "`".$aColumns[$i]."` LIKE '%".utf8_decode($gaSql['link']->real_escape_string($_GET['sSearch_'.$i]))."%' ";
            }
    }


    /*
     * SQL queries
     * Get data to display
     */
    $sQuery = "
            SELECT SQL_CALC_FOUND_ROWS `".str_replace(" , ", " ", implode("`, `", $aColumns))."`
            FROM   $sTable
            $sInner    
            $sWhere
            $sOrder
            $sLimit
            ";
    $rResult = $gaSql['link']->query($sQuery) or fatal_error( 'MySQL Error: ' . $gaSql['link']->connect_errno);

    /* Data set length after filtering */
    $sQuery = "
            SELECT FOUND_ROWS()
    ";
    $rResultFilterTotal = $gaSql['link']->query($sQuery) or fatal_error( 'MySQL Error: ' . $gaSql['link']->connect_errno);
    $aResultFilterTotal = mysqli_fetch_array($rResultFilterTotal);
    $iFilteredTotal = $aResultFilterTotal[0];

    /* Total data set length */
    $sQuery = "
            SELECT COUNT(`".$sIndexColumn."`)
            FROM   $sTable
    ";
    $rResultTotal = $gaSql['link']->query($sQuery) or fatal_error( 'MySQL Error: ' . $gaSql['link']->connect_errno );
    $aResultTotal = mysqli_fetch_array($rResultTotal);
    $iTotal = $aResultTotal[0];


    /*
     * Output
     */
    $output = array(
            "sEcho" => intval($_GET['sEcho']),
            "iTotalRecords" => $iTotal,
            "iTotalDisplayRecords" => $iFilteredTotal,
            "aaData" => array()
    );

    while ( $aRow = mysqli_fetch_array( $rResult ) )
    {
            $row = array();
            for ( $i=0 ; $i<count($aColumns) ; $i++ )
            {
                    if ( $aColumns[$i] == "version" )
                    {
                            /* Special output formatting for 'version' column */
                            $row[$aColumns[$i]] = utf8_encode(($aRow[ $aColumns[$i] ]=="0") ? '-' : $aRow[ $aColumns[$i] ]);
                    }
                    else if ( $aColumns[$i] != ' ' )
                    {
                            /* General output */
                            if($aColumns[$i] == 'pessoa_email'){
                                $row[$aColumns[$i]] = "<a href='mailto:".utf8_encode($aRow[ $aColumns[$i] ])."' target='_top'>".utf8_encode($aRow[ $aColumns[$i] ])."</a>";
                            }else{
                                $row[$aColumns[$i]] = utf8_encode($aRow[ $aColumns[$i] ]);
                            }
                            
                    }
            }
            $output['aaData'][] = $row;
    }

    echo json_encode( $output );

