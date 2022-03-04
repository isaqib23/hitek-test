<?php
require 'vendor/autoload.php';
require 'db/MysqlDB.php';
require 'inc/getAlphabets.php';
require 'inc/array_group_by.php';
require 'inc/getColRange.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Change DB Credentials before running
$db = new MysqlDB("localhost", "root", "", "planner");

// Generating new SPreadsheet
$spreadsheet = new Spreadsheet();

$sheet = $spreadsheet->getActiveSheet();

// Preparing headers data for populating in sheet
include ("inc/generateSheetHeaders.php");

// Preparing remaining data for populating in sheet
include ("inc/generateUquipmentData.php");

// applying some formatting on sheet
include ("inc/sheetFormatting.php");

echo "
<h1>Practical Test For HITEK</h1>
<h3>Wait a few seconds, your file downloading...</h3>";


// redirect output to client browser & file should be downloading automatically after few seconds
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="SaqibHitekTest.xls"');
header('Cache-Control: max-age=0');

$writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Xls');
$writer->save('php://output');

?>