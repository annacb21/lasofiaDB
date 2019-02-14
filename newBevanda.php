<?php	
	$codice = $_POST['CodiceBevanda'];
	$nome = $_POST['NomeBevanda'];
	$marca = $_POST['Marca'];
	$quantita = $_POST['QuantitaBevanda'];
	$annata = $_POST['Annata'];
    $tipo = $_POST['Tipo'];
    $prezzo = $_POST['PrezzoBevanda'];
    $fornitore = $_POST['Fornitore'];
	
// POST items should be checked for bad information before being added to the database.

// Create connection
$con=mysqli_connect("localhost","lasofiadb","wK9dA5FybbYQ","my_lasofiadb");

$query = "INSERT INTO bevanda (CodiceBevanda, NomeBevanda, Marca, QuantitaBevanda, Annata, Tipo, PrezzoBevanda, Fornitore) VALUES ($codice, $nome, $marca, $quantita, $annata, $tipo, $prezzo, $fornitore)";


if (mysqli_query($con,$query)) {
    echo "Awesome. This works!"; 
  //This is what your app will receive as the variable returnData
} else {
   echo "Oops. Error!"; 
   echo "Error: " . $query . "<br>" . $con->error;
}

mysqli_close($con);	

?>
