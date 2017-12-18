<?php

require_once(__DIR__.'/../common_inc.php');

$action = i_isset('action');
$note   = "";

if ($action == "new_event")
{
    $note = "<span class='text-danger'>Konnte Eintrag nicht anlegen!</span>";
    $date = i_isset('date');
    $wo   = i_isset('wo');

    if ($date && $wo)
    {
        $wo   = $db->escape_string($wo);
        $darr = preg_split("/[\.]+/", $date);

        if (count($darr) == 3)
        {
            $form_date = $darr[2]."-".$darr[1]."-".$darr[0];
            $note = $form_date;

            $sql = "INSERT INTO event (datum, wo) VALUES (?, ?)";
            if ($query = $db->prepare($sql))
            {
                $query->bind_param("ss", $form_date, $wo);

                if ($query->execute())
                {
                    $note = "<span class='text-success'>Eintrag erfolgreich angelegt!</span>";
                }
            }
        }
    }
}
else if ($action == "new_comp")
{
    $note = "<span class='text-danger'>Konnte Wettkampf nicht anlegen!</span>";
    $evt_id = i_isset('event');
    $comp   = i_isset('comp');

    if ($evt_id && $comp)
    {
        $comp = $db->escape_string($comp);
        $sql  = "INSERT INTO wettkampf (evtid, name) VALUES (?, ?)";
        if ($query = $db->prepare($sql))
        {
            $query->bind_param("is", $evt_id, $comp);

            if ($query->execute())
            {
                $note = "<span class='text-success'>Wettkampf #".$query->insert_id." erfolgreich angelegt!</span>";
            }
        }
    }
}
else if ($action == "start_list")
{
    $note   = "<span class='text-danger'>Konnte Starterliste nicht anlegen!</span>";
    $evt_id = i_isset('event');
    if (!empty($_FILES) && array_key_exists('start_list_file', $_FILES) && ($evt_id !== false))
    {
        // check for error ...
        if ($_FILES['start_list_file']['error'] == UPLOAD_ERR_OK)
        {
            // load file into array
            if ($csv_arr = file($_FILES['start_list_file']['tmp_name']))
            {
                // start SQL query
                $sql     = "REPLACE INTO starterliste VALUES ";
                $success = false;

                for ($i = 1; $i < count($csv_arr); $i++)
                {
                    if ($arr = preg_split("/,/", utf8_encode($csv_arr[$i])))
                    {
                        if (count($arr) == 12)
                        {
                            $success = true;

                            if ($i > 1)
                            {
                                $sql .= ", ";
                            }

                            /**
                             * 0  -> Name
                             * 1  -> Vorname
                             * 2  -> Verein
                             * 3  -> Verband*
                             * 4  -> StNr
                             * 5  -> Klasse
                             * 6  -> Strecke*
                             * 7  -> Startzeit*
                             * 8  -> Jahrgang*
                             * 9  -> Geschlecht*
                             * 10 -> Nation*
                             * *) -> not used
                             */
                            $sql .= "('".$arr[0].", ".$arr[1]."', '".$arr[2]."', '".$arr[5]."', ".$arr[4].", ".$evt_id.")";
                        }
                    }
                }

                // echo "<!-- ".$sql." -->";

                if ($success)
                {
                    if ($db->query($sql) === true)
                    {
                        $note = "<span class='text-success'>Starterliste erfolgreich importiert!</span>";
                    }
                }
            }
            else
            {
                $note = "<span class='text-success'>Kann Datei nicht öffnen!</span>";
            }

            unlink($_FILES['start_list_file']['tmp_name']);
        }
        else
        {
            $note = "<span class='text-success'>Upload Error!</span>";
        }
    }
}

// -----------------------------------------------------------------------------
//! \brief create selects
// -----------------------------------------------------------------------------
$event = 0;
$sql = "SELECT id, DATE_FORMAT(datum, '%d.%m.%Y') as date, wo FROM event order by id desc";
$statement = $db->prepare($sql);
$statement->execute();
$result = $statement->get_result();

$evt_array = array(
    'name'        => 'event',
    'cssid'       => 'event',
    'onchange'    => '',
    'option_list' => array()
);

while ($row = $result->fetch_object())
{
    $evt_array['option_list'][] = array('id' => $row->id, 'value' => $row->date.", ".$row->wo, 'selected' => '');
}

$evt_array2 = $evt_array;
$evt_array2['cssid'] = 'event2';

$core = new Dwoo\Core();
try
{
    $core->setTemplateDir("../templates");
    $tpl  = new Dwoo\Template\File('select.tpl');
    $tpl->setIncludePath('../templates');

    $pln_data = new Dwoo\Data();
    $pln_data->assign('date', "");
    $pln_data->assign('wo', "");
    $pln_data->assign('comp', "");
    $pln_data->assign('self', $_SERVER['PHP_SELF']);
    $pln_data->assign('evt_sel', $core->get($tpl, $evt_array));
    $pln_data->assign('evt2_sel', $core->get($tpl, $evt_array2));
    $content  = $core->get('planung.tpl', $pln_data);

    $data = new Dwoo\Data();
    $data->assign('title', "Wettkampfplanung");
    $data->assign('content', $content);
    $data->assign('note', $note);
    $data->assign('script', "");

    echo $core->get('site.tpl', $data);
}
catch (\Dwoo\Exception $e)
{
    echo "Error in ". $e->getFile().":".$e->getLine().": ".$e->getMessage();
}
?>