<?php
// // function for generating all alphabets of excel sheet
function getAlphabets(){
    $alphabets = range('A', 'Z');
    foreach(range('A', 'Z') as $letter1) {
        foreach(range('A', 'Z') as $letter2) {
            array_push($alphabets,$letter1 . $letter2);
        }
    }

    return $alphabets;
}
?>