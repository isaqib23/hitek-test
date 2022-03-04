<?php
// function for getting for sheet column range
function getColRange($start_letter, $row_number, $count) {

    $start_idx = array_search(
        $start_letter,
        getAlphabets()
    );

    return sprintf(
        "%s%s:%s%s",
        $start_letter,
        $row_number,
        getAlphabets()[$start_idx + $count],
        $row_number
    );
}
?>