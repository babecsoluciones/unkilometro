<? header('Access-Control-Allow-Origin: *');  ?>
<? header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method"); ?>
<? header("Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE"); ?>
<? header("Allow: GET, POST, OPTIONS, PUT, DELETE"); ?>
<? header('Content-Type: application/json'); ?>
<?

if (isset($_SERVER{'HTTP_ORIGIN'})) {
        header("Access-Control-Allow-Origin: {$_SERVER{'HTTP_ORIGIN'}}");
        header('Access-Control-Allow-Credentials: true');
        header('Access-Control-Max-Age: 86400');    // cache for 1 day
    }



require_once("../../../cnx/cnx-web.php");
include("../../../inc/fun-ini.php");

//$tDominio = obtenerURL();
$tDominio = "";

session_start();


$data = json_decode( file_get_contents('php://input') );

$eCodEstado     = $data->eCodEstado      ? $data->eCodEstado : $_SESSION['sesionEstado']['eCodEstado'];
$eCodMunicipio  = $data->eCodMunicipio   ? $data->eCodMunicipio     : false;
$tNombre        = $data->tTitulo         ? "'%".str_replace(" ","%",$data->tTitulo)."%'" : false;
$eCodMarca      = $data->eCodMarca       ?   $data->eCodMarca       :   false;
$eCodTipo       = $data->eCodTipo        ?   $data->eCodTipo        :   false;

$dPrecioMin     = $data->dPrecioMin      ? $data->ePrecioMin        : 0;
$dPrecioMax     = $data->ePrecioMax      ? $data->ePrecioMax        : $dPrecioMin;
$eAnio          = $data->eAnio           ? $data->eAnio             : false;
$eCilindros     = $data->eCilindros      ? $data->eCilindros        : false;

$bLote          = $data->bLote           ? $data->bLote             : false;



$eRegistroInicio = ($data->ePagina == 1) ? 0 : ($data->ePagina + 24);
$eRegistroFin = $eRegistroInicio+24;

$rdOrden = $data->rdOrden ? $data->rdOrden : "eCodPublicacion DESC";

$tHTML = '';

$select = "SELECT 
            bp.*, 
            (SELECT tArchivo FROM RelPublicacionesImagenes WHERE eCodPublicacion = bp.eCodPublicacion ORDER BY eCodImagen ASC LIMIT 0,1) tImagen 
            FROM BitPublicaciones bp 
            INNER JOIN RelPublicacionesCaracteristicas rc ON rc.eCodPublicacion=bp.ecodPublicacion AND rc.eCodCaracteristica = 3 
            WHERE eCodEstatus = 3 ".
            ($eCodEstado    ? " AND bp.eCodEstado = $eCodEstado " : "").
            ($eCodMunicipio ? " AND bp.eCodMunicipio = $eCodMunicipio " : "").
            ($tNombre       ? " AND bp.tTitulo LIKE $tNombre " : "").
            ($eCodMarca     ? " AND bp.eCodMarca = $eCodMarca " : "").
            ($eCodTipo      ? " AND bp.eCodTipo = $eCodTipo " : "").
            ($eAnio         ? " AND bp.eModelo = $eAnio " : "").
            ($eCilindros    ? " AND rc.tValor = $eCilindros " : "").
            ($dPrecioMin    ? " AND bp.dPrecio BETWEEN $dPrecioMin AND $dPrecioMax " : "").
            //si quieren ver lote de autos solamente
            ($bLote         ? " AND bp.eCodEntidad IS NOT NULL " : "");
    
    $select = "SELECT * FROM ($select)N1 ORDER BY $rdOrden LIMIT $eRegistroInicio, $eRegistroFin";
$rsPublicaciones = mysql_query($select);
while($rPublicacion = mysql_fetch_array($rsPublicaciones))
{
    $tHTML .= '
    <div class="col-md-4 product-men mt-5">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item text-center">
											<img src="'.$tDominio.$rPublicacion{'tImagen'}.'" alt="" class="img-responsive" width="100%">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="/detalles/v1/'.sprintf("%07d",$rPublicacion{'eCodPublicacion'}).'/" class="link-product-add-cart">Ver m&aacute;s</a>
												</div>
											</div>
										</div>
										<div class="item-info-product text-center border-top mt-4">
											<h4 class="pt-1">
												<a href="/detalles/v1/'.sprintf("%07d",$rPublicacion{'eCodPublicacion'}).'/">'.utf8_encode(substr($rPublicacion{'tTitulo'},0,17)).'...</a>
											</h4>
											<div class="info-product-price my-2">
												<span class="item_price">$'.number_format($rPublicacion{'dPrecio'}, 2, '.', ',').'</span>
												
											</div>
											
										</div>
									</div>
								</div>
    ';
}

echo json_encode(array('exito'=>(mysql_num_rows($rsPublicaciones) ? 1 : 0),'tHTML'=>$tHTML));

?>