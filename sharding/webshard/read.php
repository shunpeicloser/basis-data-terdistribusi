<?php
    require_once("./db.php");
    $data = $collection->find();
    $data = $data->toArray();
    $numOfData = sizeof($data);
    $fieldName = array();
    foreach($data[0] as $key => $fd){
	if($key == "_id")
            continue;
	array_push($fieldName, $key);
    }
    $state = [];
    foreach($collection->distinct("STATE") as $statename){
        $state[$statename] = NULL;
    }
    var_dump($state);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hate Crime in India</title>
</head>
<body>
    <h1>Number of Data: <?php echo $numOfData; ?></h1>
    <h2>Summary</h2>
    <table>
	<tr>
            <?php
                foreach($fieldName as $field){
		    echo "<th>$field</th>";
		}
            ?>

        </tr>
    </table>
</body>
</html>
