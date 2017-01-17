# HTZMT Zeiten Logger

## In aller Kürze

Die Einlauf-Zeiten müssen per __HTTP Get Request__ an eine Internet Adresse gesendet werden.

## Zu sendende Daten

Als Daten müssen die Startnummer (_startNum_), die Runden- und / oder Laufzeit (_time_) und ein Hash-Code (_hash_) gesendet werden.

## Datenformat

* startNum
  * Die Startnummer muss als dezimale Zahl gesendet werden.
* time
  * Die Zeit muss im Format Stunde:Minute:Sekunde.Millisekunde (h:mm:ss.SSS) formatiert sein.
* hash
  * Der Hash wird aus den md5-Summen der Startnummer, der Zeit und des aktuellen Datums berechnet.

## Hash-Berechnung

Folgender Pseudo-Code soll die Hash-Berechnung verdeutlichen:

```C
string calcHash(string startNumber, string time)
{
    // get current date in needed format ...
    string date = CurrentDate.toFormat("yyyy-MM-dd");
    
    // calculate hash code using start number, time and current 
    // date in combination with md5() function ...
    string hash = md5(startNumber + md5(time + md5(date)));
    return hash;
}
```

## URL

Die Url an die die Daten gesendet werden sollen, muss konfigurierbar sein. 

## Beispiel

Folgendes Beispiel stellt die komplette URL mit Daten dar, die am 16.01.2017 valid wäre:

    http://logger.htzmt.de/insert_time.php?startNum=123&time=0:01:56.123&hash=c8ffe9a587b126f152ed3d89a146b445

## Gegenprobe auf dem Server

Das Gegenstück auf dem Server würde die Daten dann auf folgende Weise in __PHP__ validieren:

```PHP
// ------------------------------------
/// \brief check hash for validness
/// \returns true if valid
// ------------------------------------
function checkHash()
{
    $date = date("Y-m-d");
    $time = $_GET['time'];
    $numb = $_GET['startNum'];
    $hash = $_GET['hash'];

    return (md5($numb + md5($time + md5($date))) === $hash);
}
```

