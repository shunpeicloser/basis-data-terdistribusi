<?php
    require_once("./db.php");

    $action = $_POST['action'];
    $id = $_POST['_id'];
    $data = $_POST['data'];

    $data['Year'] = intval($data['Year']);
    $data['Murder'] = intval($data['Murder']);
    $data['Assault on women'] = intval($data['Assault on women']);
    $data['Kidnapping and Abduction'] = intval($data['Kidnapping and Abduction']);
    $data['Robbery'] = intval($data['Robbery']);
    $data['Arson'] = intval($data['Arson']);
    $data['Hurt'] = intval($data['Hurt']);
    $data['Prevention of atrocities (POA) Act'] = intval($data['Prevention of atrocities (POA) Act']);
    $data['Protection of Civil Rights (PCR) Act'] = intval($data['Protection of Civil Rights (PCR) Act']);
    $data['Other Crimes Against SCs'] = intval($data['Other Crimes Against SCs']);

    // var_dump($data); die();

    if($action == "update"){
        $res = $collection->updateOne(
            ['STATE' => $data['STATE'], 'DISTRICT' => $data['DISTRICT'], 'Year' => $data['Year']],
            ['$set' => $data]
        );
        var_dump($res->getMatchedCount(),$res->getModifiedCount());
    } else if($action == "create") {

    } else if($action == "delete") {

    }