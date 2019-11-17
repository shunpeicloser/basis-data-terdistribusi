<?php
    require_once("./db.php");
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
        <input type="hidden" readonly name="action" value="create">
        State <input type="text" name="data[STATE]" > <br/>
        District <input type="text" name="data[DISTRICT]" > <br/>
        Year <input type="text" name="data[Year]" > <br/>
        Murder <input type="number" name="data[Murder]" > <br/>
        Assault on women <input type="number" name="data[Assault on women]" > <br/>
        Kidnapping and Abduction <input type="number" name="data[Kidnapping and Abduction]" > <br/>
        Robbery <input type="number" name="data[Robbery]" > <br/>
        Arson <input type="number" name="data[Arson]" > <br/>
        Hurt <input type="number" name="data[Hurt]" > <br/>
        Prevention of atrocities (POA) Act <input type="number" name="data[Prevention of atrocities (POA) Act]" > <br/>
        Protection of Civil Rights (PCR) Act <input type="number" name="data[Protection of Civil Rights (PCR) Act]" > <br/>
        Other Crimes Against SCs <input type="number" name="data[Other Crimes Against SCs]" > <br/>
        <button type="submit">Create</button>
    </form>    
</body>
</html>
