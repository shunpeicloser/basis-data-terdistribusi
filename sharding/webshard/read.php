<?php
    require_once("./db.php");
    // $data = $collection->find();
    // $data = $data->toArray();
    // $numOfData = sizeof($data);
    $numOfData = $collection->aggregate([
        [
            '$group' => [
                '_id' => 'null',
                'num' => ['$sum' => 1]
            ]
        ]

    ])->toArray()[0]['num'];
    // var_dump($numOfData); die();
    $summary = array();

    array_push($summary, $collection->aggregate([
        [
            '$group' => [
                '_id'   => ['state' => '$STATE', 'year' => '$Year'],
                'Murder' => ['$sum' => '$Murder'],
                'Assault on women' => ['$sum' => '$Assault on women'],
                'Kidnapping and Abduction' => ['$sum' => '$Kidnapping and Abduction'],
                'Robbery' => ['$sum' => '$Robbery'],
                'Arson' => ['$sum' => '$Arson'],
                'Hurt' => ['$sum' => '$Hurt'],
                'Prevention of atrocities (POA) Act' => ['$sum' => '$Prevention of atrocities (POA) Act'],
                'Protection of Civil Rights (PCR) Act' => ['$sum' => '$Protection of Civil Rights (PCR) Act'],
                'Other Crimes Against SCs' => ['$sum' => '$Other Crimes Against SCs']
            ]
        ]
    ])->toArray() );

    $summaries = array();
    // var_dump(sizeof($summary[0])); die();
    foreach($summary[0] as $s){
        $summaries[$s['_id']['state']][$s['_id']['year']] = array(
            'Murder' => $s['Murder'],
            'Assault on women' => $s['Assault on women'],
            'Kidnapping and Abduction' => $s['Kidnapping and Abduction'],
            'Robbery' => $s['Robbery'],
            'Arson' => $s['Arson'],
            'Hurt' => $s['Hurt'],
            'Prevention of atrocities (POA) Act' => $s['Prevention of atrocities (POA) Act'],
            'Protection of Civil Rights (PCR) Act' => $s['Protection of Civil Rights (PCR) Act'],
            'Other Crimes Against SCs' => $s['Other Crimes Against SCs']
        );
    }


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hate Crime in India</title>
    <style>
        th,td{
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h1>Number of Data: <?php echo $numOfData; ?></h1>
    <h2>Summary</h2>
    <table>
	<tr>
        <th>State</th>
        <th>Year</th>
        <th>Murder</th>
        <th>Assault on women</th>
        <th>Kidnapping and Abduction</th>
        <th>Robbery</th>
        <th>Arson</th>
        <th>Hurt</th>
        <th>Prevention of atrocities (POA) Act</th>
        <th>Protection of Civil Rights (PCR) Act</th>
        <th>Other Crimes Against SCs</th>
    </tr>
    <?php
        foreach($summaries as $statekey => $statedata){
            $flag = 0;
            echo "<tr>";
            echo "<td rowspan='".strval(sizeof($statedata)+1)."'>$statekey</td>";
                    
            foreach($statedata as $yearkey => $yeardata){
                // var_dump($yeardata); die();
                if($flag == 0){
                    echo "</tr>";
                    $flag = 1;
                }        
                echo "<tr>";
                echo "<td>$yearkey</td>";
                echo "<td>".$yeardata['Murder']."</td>";
                echo "<td>".$yeardata['Assault on women']."</td>";
                echo "<td>".$yeardata['Kidnapping and Abduction']."</td>";
                echo "<td>".$yeardata['Robbery']."</td>";
                echo "<td>".$yeardata['Arson']."</td>";
                echo "<td>".$yeardata['Hurt']."</td>";
                echo "<td>".$yeardata['Prevention of atrocities (POA) Act']."</td>";
                echo "<td>".$yeardata['Protection of Civil Rights (PCR) Act']."</td>";
                echo "<td>".$yeardata['Other Crimes Against SCs']."</td>";
                echo "</tr>";
            }
        }
    ?>
    </table>
</body>
</html>
