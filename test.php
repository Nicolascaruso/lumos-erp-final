<?php
$link = mysqli_connect('localhost', 'u771856623_LumosDB', 'Nc221282@123');
if (!$link) {
die('Could not connect: ' . mysqli_error());
}
echo 'Connected successfully';
mysqli_close($link);
?>