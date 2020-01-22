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

session_start();


$data = json_decode( file_get_contents('php://input') );

$select = "SELECT * FROM CatEstados WHERE eCodEstado = ".$data->eEstado;
$rsEstado = mysql_query($select);
$rEstado = mysql_fetch_array($rsEstado);

$_SESSION['sesionEstado']['eCodEstado'] = $rEstado{'eCodEstado'};
$_SESSION['sesionEstado']['tNombre'] = $rEstado{'tNombre'};

echo json_encode(array('exito'=>(mysql_num_rows($rsEstado) ? 1 : 0)));

?>