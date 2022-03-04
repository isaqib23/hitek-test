<?php
// funtion for sorting array by group of value
function array_group_by( $old_arr, $fldName) {
    $arr = [];
    foreach ($old_arr as $key => $item) {
        $arr[$item[$fldName]][$key] = $item;
     }

     ksort($arr, SORT_NUMERIC);

     return $arr;
}
?>