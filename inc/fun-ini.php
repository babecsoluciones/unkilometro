<?php
//require("../cnx/cnx-web.php");

function buscarEstados($validar = false)
{
    session_start();
    
    print '<option value="">Seleccione...</option>';
	$select = "SELECT * FROM CatEstados WHERE 1=1 ".
        ($validar ? " AND eCodEstado IN (SELECT DISTINCT eCodEstado FROM BitPublicaciones WHERE eCodEstatus = 3)" : "");
	$rsEstados = mysql_query($select);
	while($rEstado = mysql_fetch_array($rsEstados))
    {
    	print '<option value="'.$rEstado{'eCodEstado'}.'" '.(($rEstado{'eCodEstado'}==$_SESSION['sesionEstado']['eCodEstado']) ? 'selected' : '').'>'.$rEstado{'tNombre'}.'</option>';
    }
}

?>