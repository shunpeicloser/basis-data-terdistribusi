<?php
    require_once("./db.php");
    $data = $collection->find();
    $data = $data->toArray();
    $current = $data[rand(0, sizeof($data)-1)];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hate Crime in India</title>
    <style>
        input{
            height: 32px;
        }
    </style>
</head>
<body>
    <h2>Data</h2>
    <form action="action.php" method="post">
        <input type="hidden" readonly name="action" value="update">
        State <input type="text" name="data[STATE]" readonly value="<?php echo $current["STATE"]; ?>"> <br/>
        District <input type="text" name="data[DISTRICT]" readonly value="<?php echo $current["DISTRICT"]; ?>"> <br/>
        Year <input type="text" name="data[Year]" readonly value="<?php echo $current["Year"]; ?>"> <br/>
        Murder <input type="number" name="data[Murder]" value="<?php echo $current["Murder"]; ?>"> <br/>
        Assault on women <input type="number" name="data[Assault on women]" value="<?php echo $current["Assault on women"]; ?>"> <br/>
        Kidnapping and Abduction <input type="number" name="data[Kidnapping and Abduction]" value="<?php echo $current["Kidnapping and Abduction"]; ?>"> <br/>
        Robbery <input type="number" name="data[Robbery]" value="<?php echo $current["Robbery"]; ?>"> <br/>
        Arson <input type="number" name="data[Arson]" value="<?php echo $current["Arson"]; ?>"> <br/>
        Hurt <input type="number" name="data[Hurt]" value="<?php echo $current["Hurt"]; ?>"> <br/>
        Prevention of atrocities (POA) Act <input type="number" name="data[Prevention of atrocities (POA) Act]" value="<?php echo $current["Prevention of atrocities (POA) Act"]; ?>"> <br/>
        Protection of Civil Rights (PCR) Act <input type="number" name="data[Protection of Civil Rights (PCR) Act]" value="<?php echo $current["Protection of Civil Rights (PCR) Act"]; ?>"> <br/>
        Other Crimes Against SCs <input type="number" name="data[Other Crimes Against SCs]" value="<?php echo $current["Other Crimes Against SCs"]; ?>"> <br/>
        <button type="submit">Update</button>
    </form>    
</body>
</html>
