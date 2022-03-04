<?php
// Logic for pupolating remaing data into sheet

// getting equipments data from DB table 
$query = "SELECT E.id, E.name, ESM.value, ESM.shift_id FROM equipments E 
JOIN equipment_shift_mapping ESM ON E.id = ESM.equipment_id";
$equipments = $db->query($query);

$equipments = array_group_by($equipments, 'id');


$equipmentData = [];
$results = [];

// logic for getting excel sheet all cells
for($i=1; $i<=36; $i++){
    array_push($results,0);
}

// logic for preparing remaing data into one array & then populating into sheet at once
foreach($equipments as $key => $value){
$results = [];
    for($i=1; $i<=36; $i++){
        array_push($results,0);
    }

$keys = array_keys($value);

$results[0] = $value[$keys[0]]["name"];
    foreach($value as $key1 => $val){
        $results[$val["shift_id"]+1] = $val["value"];
    }

    array_push($equipmentData,$results);
}


$sheet->fromArray( $equipmentData, NULL, 'B3' );
?>