<?php
// logic for formatiing of sheet

// setting first 2 columns width
$spreadsheet->getActiveSheet()->getColumnDimension('A')->setWidth(10, 'pt');
$spreadsheet->getActiveSheet()->getColumnDimension('B')->setWidth(450, 'pt');


foreach(getAlphabets() as $key => $value){
    if($key < count($shifts)+2 && $key > 1){
        // setting remaing colums widht
        $spreadsheet->getActiveSheet()->getColumnDimension($value)->setWidth(20, 'pt');

        $styleArray = [
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_RIGHT,
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
                'rotation' => 90,
                'startColor' => [
                    'argb' => 'FDFF00',
                ],
                'endColor' => [
                    'argb' => 'FDFF00',
                ],
            ],
        ];

        // logic for setting cell & text color for values
        for($i=3; $i<=count($equipments)+2; $i++){
            if(!is_null($sheet->getCell($value.$i)->getValue())){
                $sheet->getStyle($value.$i)->getFill()
                ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                ->getStartColor()->setARGB('1F01FF');

                $sheet->getStyle($value.$i)->getFont()->setColor(
                    new \PhpOffice\PhpSpreadsheet\Style\Color(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_WHITE)
                );
            }
        }
    }
}
?>