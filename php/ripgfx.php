<?php 
/**
 * Converts binary to hex
 *
 * @param $bin binary
 *
 * @param $digits int (how many digits to return, overhead is filled with zeros)
 *
 * @return hex value, padded left with zeros according to $digits
 */
function binary2hex($bin, $digits = 2){
    // get the base 10 value of the current character
    $base10value = ord($bin);
    // now convert that byte from base 10 to base 2 (i.e 01001010...)
    return strtoupper( str_pad(  dechex( bindec( base_convert($base10value, 10, 2) ) )  , $digits, '0', STR_PAD_LEFT) );
}

/**
 * Converts decimal to hex
 *
 * @param $bin binary
 *
 * @param $digits int (how many digits to return, overhead is filled with zeros)
 *
 * @return hex value, padded left with zeros according to $digits
 */
function dec2hex($dec, $digits = 2){
    return strtoupper( str_pad(  dechex( bindec( base_convert($dec, 10, 2) ) )  , $digits, '0', STR_PAD_LEFT) );
}

/* ------------------------------------------------------------------------------------------------------------------- */

// set up the file operations:
$rom_filename = '../roms\Monster World IV (USA, Europe) (En,Ja) (Virtual Console).md';
$rom_filepath = __DIR__ . DIRECTORY_SEPARATOR . $rom_filename;
$gfx_dir      = __DIR__ . DIRECTORY_SEPARATOR . 'gfx' . DIRECTORY_SEPARATOR;

$noOfPntrs    = hexdec('12FF')/4; // = 1215
$pntrArray    = array();

// read FULL file:
$handle = fopen($rom_filepath, "rb");
$fsize  = filesize($rom_filepath);
$rom    = fread($handle, $fsize);
fclose($handle);

// Collect pointer data in array:
for($i=0; $i<$noOfPntrs; $i++){
    $currentOffset = hexdec('C0000')+($i*4);
    $bytes = substr($rom, $currentOffset, 4);
    $bytes_array = str_split($bytes);
    $hex_array = array_map('binary2hex', $bytes_array);
    $hex_string = implode('', $hex_array);
    if($hex_string != 'FFFFFFFF'){
        $pntrArray[] = $hex_string;
    }
}
$pntrArray[] = '154EB6'; // because last length info is missing, add this one manually

// use array to dump data:
for($i=0; $i<count($pntrArray)-1; $i++) {
    $type         = substr($pntrArray[$i],0,2);
    $hexval       = substr($pntrArray[$i],2,6);
    $dataLocation = hexdec($hexval);
    $dataLen      = hexdec(substr($pntrArray[$i+1],2,6)) - $dataLocation;
    $data         = substr($rom, $dataLocation, $dataLen);
    $dataFilename = $gfx_dir.$type.'_'.$hexval.'.cbin';
    file_put_contents($dataFilename, substr($rom, $dataLocation, $dataLen));
    echo $dataFilename . "\n";
}
?>