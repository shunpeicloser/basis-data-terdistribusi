<?php
    require 'vendor/autoload.php';
    $client = new MongoDB\Client("mongodb://localhost:27017");
    $collection = $client->{'hate_crime_india'}->{'crime_by_district'};