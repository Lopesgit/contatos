

$(document).ready( function () { 
  
  var rowSelected = null;
  var rowName = null;
  var action = null;
  var msg = null;
  var salvar = false;
  var deletar = false;
  
  
  var oTable = $('#tb_func').dataTable({  
        "bJQueryUI": true,
        "bProcessing": true,
        "bServerSide": true,
        "sAjaxSource": "datasource.php",
        "sPaginationType": "full_numbers",
        "aoColumns": [
            {"mData": "pessoa_nome",
            "sClass": "center"},
            {"mData": "filial_nome",
            "sClass": "center"},
            {"mData": "depto_nome",
            "sClass": "center"},
            {"mData": "pessoa_email",
            "sClass": "center"},
            {"mData": "pessoa_ramal",
            "sClass": "center"},
            {"mData": "pessoa_ramaldireto",
            "sClass": "center"},
            {"mData": "pessoa_celulartim",
            "sClass": "center"},
            {"mData": "pessoa_nextel",
            "sClass": "center"},
            {"mData": "status_desc",
            "sClass": "center"},
            {"mData": null,
            "sClass": "center",
            "sDefaultContent": '<span id="edit"><img src="img/editar.png" alt="Smiley face" height="30" width="30"></span>\n\
                                <span></span>\n\
                                <span id="delete"><img src="img/excluir.png" alt="Smiley face" height="30" width="30"></span>'}
            
        ],
        "aLengthMenu": [
            [25, 50, 75, 100, 125, 150, 175, 200, -1],
            [25, 50, 75, 100, 125, 150, 175, 200, "TODOS"]
        ],
        "iDisplayLength": 25,
        "oLanguage": {
                "sProcessing":   "Processando...",
                "sLengthMenu":   "Mostrar _MENU_ registros",
                "sZeroRecords":  "Não foram encontrados resultados",
                "sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty":    "Mostrando de 0 até 0 de 0 registros",
                "sInfoFiltered": "(filtrado de _MAX_ registros no total)",
                "sInfoPostFix":  "",
                "sSearch":       "Buscar:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "Primeiro",
                    "sPrevious": "Anterior",
                    "sNext":     "Seguinte",
                    "sLast":     "Último"
                }
            }
    });
    
    $("#tb_func tbody").on('mouseover', 'tr', function(event){
        rowName = oTable.fnGetData(this)['pessoa_nome'];
        rowSelected = oTable.fnGetData(this)['DT_RowId'];
    });
    
    $("#tb_func tbody ").on('click', '#edit', function(event){
        $("#dialog-form").dialog('option', 'title', 'Alterar o cadastro de ' + rowName);
        $("#lb_status").show();
        $("#status").show();
        
        $("#filial").find('option:selected').removeAttr("selected");
        $("#depto").find('option:selected').removeAttr("selected");
        $("#status").find('option:selected').removeAttr("selected");
        
        action = "UPDATE";
        $.post("dataactions.php",
        {action: "SELECT", id: rowSelected},
        function(data){         
            $("#id").val(rowSelected);
            $("#nome").val(data.pessoa_nome);            
            $('#filial option[value="'+data.id_filial+'"]').prop("selected", true); 
            $('#depto option[value="'+data.id_depto+'"]').prop("selected", true); 
            $("#email").val($.trim(data.pessoa_email));
            $("#ramal").val(data.pessoa_ramal);
            $("#ramal_direto").val(data.pessoa_ramaldireto);
            $("#cel_tim").val(data.pessoa_celulartim);
            $("#nextel").val(data.pessoa_nextel);
            $('#status option[value="'+data.idstatus+'"]').prop("selected", true); 
        },
        "json");        
         $( "#dialog-form" ).dialog( "open" );
    });
    
    $("#tb_func tbody ").on('click', '#delete', function(event){
        action = "DELETE";
        $("#msg-conf").html("Deseja realmente excluir o registro de " + rowName + " ?");
        $( "#dialog-confirm" ).dialog( "open" );
    });
    
    $(function() {
    var name = $( "#name" ),
      email = $( "#email" ),
      status = $("#status"),
      filial = $("#filial"),
      depto = $("#depto"),
      allFields = $( [] ).add( name ).add( email ),
      allSelect = $( [] ).add(status).add(filial).add(depto),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips.hide(); 
        tips
        .text( t )
        .addClass( "ui-state-highlight" );
      tips.show();  
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Tamanho de " + n + " deve ser entre " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
    
    function isEmail(o, n) {
        var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;;
        if( !emailReg.test( o.val() ) ) {
          o.addClass( "ui-state-error" );  
          updateTips( n );     
          return false;
        } else {
          return true;
        }
    }
    
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
    
    function ckeckFilialDepto(f, d){
        if(f.val() === "1" && d.val() === "1"){
            updateTips( "Para filial \"Piracicaba\" escolha um departamento diferente de \" - \"!" );
            f.addClass( "ui-state-error" );
            d.addClass( "ui-state-error" );
            return false;
        } else {
            return true;
        }
    }

    $( "#dialog-form" ).dialog({
        
      autoOpen: false,
      height: 950,
      width: 750,
      modal: true,
      position: "top",
      open: function(event, ui) { 
        tips.hide(); 
        tips
        .text( "" )
        .removeClass( "ui-state-highlight" );
        $(".ui-state-error").removeClass("ui-state-error");      
       
      },
      buttons: {
        "Salvar": function() {
          salvar = true;
          var bValid = true;
          allFields.removeClass( "ui-state-error" );
 
//          bValid = bValid && checkLength( name, "username", 3, 16 );
          bValid = bValid && checkLength( email, "email", 6, 150 );
//          bValid = bValid && checkLength( password, "password", 5, 16 );
 
//          bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
          // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
         // bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com.br" );
          bValid = bValid && isEmail(email, "Preencha o campo e-mail conforme exemplo: ui@jquery.com.br");
//          bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
          bValid = bValid && ckeckFilialDepto(filial, depto);  
             
          if ( bValid ) {
            $( "#users tbody" ).append( "<tr>" +
              "<td>" + email.val() + "</td>" +
            "</tr>" );
            var datastring = $("#cad_form").serialize();
              $.post("dataactions.php",
             datastring + '&action=' + action,
            function(data){
                
                if(data && action === "UPDATE"){
                    msg = "Contato de " + rowName + " alterado com sucesso!";
                } else if(data && action === "INSERT"){
                    msg = "Novo contato para " + rowName + " gravado com sucesso!";
                } else{
                    msg = "Erro " + data + " ao salvar as alterações!";  
                }               
                $("#msg").html(msg);
                $( "#dialog-msg" ).dialog( "open" );
                
            });
            $( this ).dialog( "close" );
          }
        },
        "Cancelar": function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
        allSelect.removeClass( "ui-state-error" );
        
        $("#filial").find('option:selected').removeAttr("selected");
        $("#depto").find('option:selected').removeAttr("selected");
        $("#status").find('option:selected').removeAttr("selected");
        
      }
    });
 
    $( "#contatoNovo" )
      .button()
      .click(function() {
        action = "INSERT";
        $("#dialog-form").dialog('option', 'title', 'Cadastrar novo contato');
        $("#lb_status").hide();
        $("#status").hide();
        $("#status").val("1");
        $('#filial option').removeAttr("selected");
        $('#depto option').removeAttr("selected");
        $("#id").val("");
        $("#nome").val("");
        $("#email").val("");
        $("#ramal").val("");
        $("#ramal_direto").val("");
        $("#cel_tim").val("");
        $("#nextel").val("");
        $( "#dialog-form" ).dialog( "open" );
      });
  });
  
    $( "#dialog-confirm" ).dialog({
      autoOpen: false,
      resizable: true,
      height:225,
      width:600,
      position: "top",
      modal: true,      
      buttons: {
        "Sim": function() {           
           $.post("dataactions.php",
           {id: rowSelected, action: action },
            function(data){
                if(data && action === "DELETE"){
                    msg = "Contato de " + rowName + " excluído com sucesso!";
                    deletar = true;
                } else {
                    msg = "Erro " + data + " ao salvar as alterações!";  
                }
               $("#msg").html(msg);
               $( "#dialog-msg" ).dialog( "open" );
            });  
          $( this ).dialog( "close" );
        },
        "Não": function() {
          $( this ).dialog( "close" );
        }
      }
    }); 
    
     $( "#dialog-msg" ).dialog({
      autoOpen: false,
      resizable: true,
      height:225,
      width:600,
      position: "top",
      modal: true,
      buttons: {
        "OK": function() { 
            $( this ).dialog( "close" );
        }
      },
      close: function() {
        window.location.reload();  
      }
    }); 
    
    $('#nome').keyup(function() {
        this.value = this.value.toLocaleUpperCase();
    });
    $("#ramal").mask('9999'); 
    $("#ramal_direto").mask('(99) 9999-9999'); 
    $("#cel_tim").focusout(function(){
        var phone, element;
        element = $(this);
        element.unmask();
        phone = element.val().replace(/\D/g, '');
        if(phone.length > 10) {
            element.mask("(99) 99999-999?9");
        } else {
            element.mask("(99) 9999-9999?9");
        }
    }).trigger('focusout');
    
    $("#nextel").mask('99*999999999999');        
} );