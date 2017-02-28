<?php
    $host='localhost';
    $user='root';
    $password='';
     
    $connection = mysql_connect($host,$user,$password);
     
    $name = $_POST['a'];
    $address = $_POST['b'];
    $cellphone = $_POST['c'];
 
     
    if(!$connection){
        die('Connection Failed');
    }
    else{
        $dbconnect = @mysql_select_db('agenda', $connection);
         
        if(!$dbconnect){
            die('Could not connect to Database');
        }
        else{
            $query = "INSERT INTO `agenda`.`usuarios` (`nombre`, `telefono`,`direccion`)
                VALUES ('$name','$cellphone','$address');";
            mysql_query($query, $connection) or die(mysql_error());
             
            echo 'Successfully added.';
            echo $query;
        }
    }
?>