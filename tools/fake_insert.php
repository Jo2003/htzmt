<?php

//------------------------------------------------------------------------------
//! Calculates the hash.
//!
//! @param      string  $num    The number
//! @param      string  $time   The time
//!
//! @return     string  The hash.
//------------------------------------------------------------------------------
function calcHash($num, $time)
{
    $date = date("Y-m-d");
    return md5($num . md5($time . md5($date)));
}

// INSERT INTO `zeiten` (`id`, `compid`, `startnum`, `zeit`) VALUES
$arr   = array();
$arr[] = array('compid' => 4, 'startnum' => 155, 'zeit' => '0:12:51.70');
$arr[] = array('compid' => 4, 'startnum' => 152, 'zeit' => '0:13:58.00');
$arr[] = array('compid' => 4, 'startnum' => 164, 'zeit' => '0:16:34.00');
$arr[] = array('compid' => 4, 'startnum' => 153, 'zeit' => '0:16:40.50');
$arr[] = array('compid' => 4, 'startnum' => 154, 'zeit' => '0:17:11.90');
$arr[] = array('compid' => 4, 'startnum' => 158, 'zeit' => '0:17:25.50');
$arr[] = array('compid' => 4, 'startnum' => 163, 'zeit' => '0:19:32.50');
$arr[] = array('compid' => 4, 'startnum' => 160, 'zeit' => '0:20:02.50');
$arr[] = array('compid' => 4, 'startnum' => 157, 'zeit' => '0:24:50.00');
$arr[] = array('compid' => 4, 'startnum' => 162, 'zeit' => '0:26:06.30');
$arr[] = array('compid' => 4, 'startnum' => 161, 'zeit' => '0:26:09.70');
$arr[] = array('compid' => 4, 'startnum' => 165, 'zeit' => '0:29:23.80');
$arr[] = array('compid' => 4, 'startnum' => 166, 'zeit' => '0:21:07.80');
$arr[] = array('compid' => 4, 'startnum' => 9  , 'zeit' => '0:24:28.60');
$arr[] = array('compid' => 4, 'startnum' => 1  , 'zeit' => '0:26:34.00');
$arr[] = array('compid' => 4, 'startnum' => 5  , 'zeit' => '0:30:15.90');
$arr[] = array('compid' => 4, 'startnum' => 24 , 'zeit' => '0:26:06.90');
$arr[] = array('compid' => 4, 'startnum' => 60 , 'zeit' => '0:17:31.10');
$arr[] = array('compid' => 4, 'startnum' => 10 , 'zeit' => '0:31:10.30');
$arr[] = array('compid' => 4, 'startnum' => 4  , 'zeit' => '0:32:47.70');
$arr[] = array('compid' => 4, 'startnum' => 19 , 'zeit' => '0:29:25.50');
$arr[] = array('compid' => 4, 'startnum' => 36 , 'zeit' => '0:25:11.90');
$arr[] = array('compid' => 4, 'startnum' => 25 , 'zeit' => '0:28:23.70');
$arr[] = array('compid' => 4, 'startnum' => 26 , 'zeit' => '0:28:10.00');
$arr[] = array('compid' => 4, 'startnum' => 3  , 'zeit' => '0:34:25.40');
$arr[] = array('compid' => 4, 'startnum' => 37 , 'zeit' => '0:26:08.40');
$arr[] = array('compid' => 4, 'startnum' => 59 , 'zeit' => '0:20:41.20');
$arr[] = array('compid' => 4, 'startnum' => 32 , 'zeit' => '0:27:23.90');
$arr[] = array('compid' => 4, 'startnum' => 45 , 'zeit' => '0:24:36.40');
$arr[] = array('compid' => 4, 'startnum' => 44 , 'zeit' => '0:24:38.20');
$arr[] = array('compid' => 4, 'startnum' => 58 , 'zeit' => '0:21:32.80');
$arr[] = array('compid' => 4, 'startnum' => 14 , 'zeit' => '0:32:39.00');
$arr[] = array('compid' => 4, 'startnum' => 40 , 'zeit' => '0:26:22.90');
$arr[] = array('compid' => 4, 'startnum' => 51 , 'zeit' => '0:24:01.80');
$arr[] = array('compid' => 4, 'startnum' => 52 , 'zeit' => '0:24:06.60');
$arr[] = array('compid' => 4, 'startnum' => 41 , 'zeit' => '0:27:29.40');
$arr[] = array('compid' => 4, 'startnum' => 27 , 'zeit' => '0:31:09.60');
$arr[] = array('compid' => 4, 'startnum' => 49 , 'zeit' => '0:25:54.20');
$arr[] = array('compid' => 4, 'startnum' => 21 , 'zeit' => '0:33:47.50');
$arr[] = array('compid' => 4, 'startnum' => 18 , 'zeit' => '0:35:17.60');
$arr[] = array('compid' => 4, 'startnum' => 71 , 'zeit' => '0:22:36.00');
$arr[] = array('compid' => 4, 'startnum' => 13 , 'zeit' => '0:37:13.60');
$arr[] = array('compid' => 4, 'startnum' => 74 , 'zeit' => '0:21:44.20');
$arr[] = array('compid' => 4, 'startnum' => 47 , 'zeit' => '0:29:17.70');
$arr[] = array('compid' => 4, 'startnum' => 2  , 'zeit' => '0:40:19.90');
$arr[] = array('compid' => 4, 'startnum' => 12 , 'zeit' => '0:37:58.80');
$arr[] = array('compid' => 4, 'startnum' => 46 , 'zeit' => '0:29:53.00');
$arr[] = array('compid' => 4, 'startnum' => 54 , 'zeit' => '0:28:25.70');
$arr[] = array('compid' => 4, 'startnum' => 55 , 'zeit' => '0:28:30.80');
$arr[] = array('compid' => 4, 'startnum' => 53 , 'zeit' => '0:29:17.30');
$arr[] = array('compid' => 4, 'startnum' => 31 , 'zeit' => '0:34:50.90');
$arr[] = array('compid' => 4, 'startnum' => 70 , 'zeit' => '0:24:53.60');
$arr[] = array('compid' => 4, 'startnum' => 38 , 'zeit' => '0:33:22.90');
$arr[] = array('compid' => 4, 'startnum' => 39 , 'zeit' => '0:33:24.60');

// create curl resource
$ch = curl_init();

for($i = 0; $i < count($arr); $i++)
{
    $req = "http://htzmt.coujo.de/.logger/insert_time.php?startNum="
        .$arr[$i]['startnum']."&time=".$arr[$i]['zeit']."&compid="
        .$arr[$i]['compid']."&hash=".calcHash($arr[$i]['startnum'], $arr[$i]['zeit']);

    echo $req."\n";

    // set url
    curl_setopt($ch, CURLOPT_URL, $req);

    //return the transfer as a string
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    // $output contains the output string
    echo curl_exec($ch)."\n";

    sleep(8);
}

// close curl resource to free up system resources
curl_close($ch);

?>