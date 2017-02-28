<?php 

//Create conection
$con=mysqli_connect("localhost","root","","Agenda")
			 	//. Localhost 	username  dbname

//check connection
if (mysql_connect_errno())
{
	echo "Failed to connect to database" . mysql_connect_error();
}

//This sql statements selects all from table 'usuarios'
$sql = "SELECT * FROM usuarios";

//verify if there are results
if ($result = mysqli_query($con, $sql))
{
	//if so, then create a results array and a temporary one 
	//to hold the data 
	$resultArray = array();
	$tempArray = array();

	//loop trough each row in the result set
	while ($row = $result->fetch_object()) 
	{
		//add each row into our results array
		$tempArray = $row;
		array_push($resultArray, $tempArray);
	}

	//finally, encode the array to JSON and output the results 
	echo json_encode($resultArray);

}

//close connections
mysqli_close($con);
?>

