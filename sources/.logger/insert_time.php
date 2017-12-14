<?php

// MySQL access data ...
define('DB_HOST', 'localhost');
define('DB_USER', 'web100');
define('DB_PASS', 'nIhO,dGbdC4');
define('DB_NAME', 'usr_web100_3');

//
// @brief check hash for validness
//
// @param      string  $num    The number
// @param      string  $time   The time
// @param      string  $hash   The hash
//
// @return     bool  true if hash is ok
//
function checkHash($num, $time, $hash)
{
    $date = date("Y-m-d");
    return (md5($num . md5($time . md5($date))) === $hash);
}

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

        // check for overflow ...
        if (floatval($ssec) == 60.0)
        {
            $ssec = number_format(0, 2, ".", "");

            $mins++;

            if ($mins == 60)
            {
                $mins = 0;
                $hours++;
            }
        }

        $ret  = sprintf("%d:%02d:%05s", $hours, $mins, $ssec);
    }

    return $ret;
}

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

if (   array_key_exists('hash', $_GET)
	&& array_key_exists('startNum', $_GET)
	&& array_key_exists('time', $_GET)
	&& array_key_exists('compid', $_GET) )
{
    if (checkHash($_GET['startNum'], $_GET['time'], $_GET['hash']))
    {
        // format time ...
        $time = formatTime($_GET['time']);

        if ($time != "")
        {
            $db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

            if ($db->connect_errno)
            {
                die("Verbindung fehlgeschlagen: " . $db->connect_error);
            }
            $db->set_charset("utf8");

            $query = "insert into zeiten (compid, startnum, zeit) values ("
                .$_GET['compid'].", "
                .$_GET['startNum'].", '"
                .$time."')";

            if ($db->query($query))
            {
                // must be removed when final!!!
                echo "Sucess! Used sql query: ".$query;

                // save insert id ...
                file_put_contents(__DIR__."/stamp.txt", (string)$db->insert_id);
            }
            else
            {
                // must be removed when final!!!
                echo "Error! Used sql query: ".$query;
            }
        }
        else
        {
            echo "<b>Wrong time format! (should be hh:mm:ss.x)</b>";
        }
    }
    else
    {
    	// must be removed when final!!!
    	echo "<b>Wrong hash! Should be " . calcHash($_GET['startNum'], $_GET['time']) . "</b>";
    }
}
else
{
	// must be removed when final!!!
	echo "<b>Missing values!</b>";
}

?>
