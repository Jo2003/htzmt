<?php
// MySQL access data ...
define('DB_HOST', 'localhost');
define('DB_USER', 'web100');
define('DB_PASS', 'nIhO,dGbdC4');
define('DB_NAME', 'usr_web100_3');

// traces on while in development ...
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once(__DIR__.'/dwoo-1.3.6/vendor/autoload.php');

//------------------------------------------------------------------------------
//! extract value from array
//!
//! @param      string  $key    key to extract
//! @param bool $usecookie      use cookie as source
//!
//! @return     mixed  extract value or false
//------------------------------------------------------------------------------
function i_isset($key, $usecookie = true)
{
    $ret = false;

    if (array_key_exists($key, $_POST))
    {
        $ret = $_POST[$key];
    }
    else if (array_key_exists($key, $_GET))
    {
        $ret = $_GET[$key];
    }
    else if (array_key_exists($key, $_COOKIE) && ($usecookie === true))
    {
        $ret = $_COOKIE[$key];
    }

    if ($ret == "")
    {
        $ret = false;
    }

    return $ret;
}

//------------------------------------------------------------------------------
//! compare results
//!
//! @param      array   $a      one array
//! @param      array   $b      second array
//!
//! @return     integer  0 -> equal, -1 -> less, 1 -> greater
//------------------------------------------------------------------------------
function cmpResData($a, $b)
{
    if ($a['ltime'] == $b['ltime'])
    {
        return 0;
    }
    return ($a['ltime'] < $b['ltime']) ? -1 : 1;
}

// -----------------------------------------------------------------------------
//! \brief init database
// -----------------------------------------------------------------------------
$db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

if ($db->connect_errno)
{
    die("Verbindung fehlgeschlagen: " . $db->connect_error);
}
$db->set_charset("utf8");

?>