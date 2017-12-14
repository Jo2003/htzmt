<?php

// MySQL access data ...
define('DB_HOST', 'localhost');
define('DB_USER', 'web100');
define('DB_PASS', 'nIhO,dGbdC4');
define('DB_NAME', 'usr_web100_3');

//------------------------------------------------------------------------------
//! format time string
//!
//! @param      string  $time   The time
//!
//! @return     string  formatted time string
//------------------------------------------------------------------------------
function formatTime($time)
{
    $ret   = "";
    $hours = 0;
    $mins  = 0;
    $secs  = 0;
    $msecs = 0;
    $err   = 0;
    $parts = preg_split("/[:\.]+/", $time);

    switch(count($parts))
    {
    case 2:
        // missing hours, minutes ...
        $secs  = (int)$parts[1];
        $msec  = (int)$parts[2];
        break;
    case 3:
        // missing hours ...
        $mins  = (int)$parts[0];
        $secs  = (int)$parts[1];
        $msec  = (int)$parts[2];
        break;
    case 4:
        $hours = (int)$parts[0];
        $mins  = (int)$parts[1];
        $secs  = (int)$parts[2];
        $msec  = (int)$parts[3];
        break;
    default:
        $err = -1;
        break;
    }

    if ($err != -1)
    {
        $secs = floatval($secs.".".$msec);
        $ssec = number_format($secs, 2, ".", "");
        $ret  = sprintf("%d:%02d:%05s", $hours, $mins, $ssec);
    }

    return $ret;
}
$data = array();


$db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if ($db->connect_errno)
{
    die("Verbindung fehlgeschlagen: " . $db->connect_error);
}
$db->set_charset("utf8");

$sql = "SELECT id, zeit FROM zeiten";
$statement = $db->prepare($sql);
$statement->execute();
$result = $statement->get_result();

while ($row = $result->fetch_object())
{
    $data[] = array('id' => $row->id, 'time' => $row->zeit);
}

for ($i = 0; $i < count($data); $i++)
{
    $time = formatTime($data[$i]['time']);

    if ($time != "")
    {
        $sql = "UPDATE zeiten SET zeit='".$time."' WHERE id=".$data[$i]['id'];
        echo $sql."<br>\n";
        $db->query($sql);
    }
}

?>
