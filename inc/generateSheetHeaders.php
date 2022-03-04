<?php
// Logic for preparing headers data for sheet

// get all data from shifts table
$shifts = $db->get("shifts");

// grouping by shift period
$grouped = array_group_by($shifts, 'shift_period');

$sheetData = [];
// preparing data for first header row
$firstRow = array_keys($grouped);

// preparing data for second header row
$secondRow = array_column($shifts,"shift_number");
array_unshift($firstRow,"");

array_push($sheetData,$firstRow);
array_push($sheetData,$secondRow);

// populating headers data into sheet
foreach($sheetData as $key => $value){
    if($key == 0){
        foreach($value as $key1 => $val){
            if($key1 > 0){
                // logic for merge cells based on dates
                $mergeCellCount = count($grouped[$val]);
                if($key1 == 1){
                    $sheet->setCellValue(getAlphabets()[2]."1", $val);
                    $sheet->mergeCells(getColRange(getAlphabets()[2],1,3)); 
                }else{
                    $excelColumnRange = ($mergeCellCount*($key1-1))+2;
                    $sheet->setCellValue(getAlphabets()[$excelColumnRange]."1", $val);
                    $sheet->mergeCells(getColRange(getAlphabets()[$excelColumnRange],1,3));
                }
            }
        }        
    }else{
        // populating second row of header in sheet
        $sheet->fromArray( $value, NULL, 'C2' );
    }
}
?>