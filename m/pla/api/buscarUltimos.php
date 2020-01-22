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

$eCodEstado = $_SESSION['sesionEstado']['eCodEstado'] ? $_SESSION['sesionEstado']['eCodEstado'] : false;

$tHTML = '';

$select = "SELECT bp.*, (SELECT tArchivo FROM RelPublicacionesImagenes WHERE eCodPublicacion = bp.eCodPublicacion ORDER BY eCodImagen ASC LIMIT 0,1) tImagen FROM BitPublicaciones bp WHERE eCodEstatus = 3 ".($eCodEstado ? " AND bp.eCodEstado = $eCodEstado " : "")." ORDER BY eCodPublicacion DESC LIMIT 0,12";
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