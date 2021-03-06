<?php
require_once('common_inc.php');
$jscript = "<script src='http://htzmt.coujo.de/templates/htzmt.js'></script>";


// -----------------------------------------------------------------------------
//! \brief init variables
// -----------------------------------------------------------------------------
$event       = i_isset('event');
$wk          = i_isset('wk');
$ak          = i_isset('ak');
$last_id     = i_isset('last_insert_id');
$requests    = array();
$evt_sel     = "";
$wk_select   = "";
$ak_select   = "";
$res_entries = "";
$note        = "";
$data_array  = array();

// -----------------------------------------------------------------------------
//! \brief create selects
// -----------------------------------------------------------------------------
$sql = "SELECT id, DATE_FORMAT(datum, '%d.%m.%Y') as date, wo FROM event order by datum desc";
$requests[] = $sql;
$statement = $db->prepare($sql);
$statement->execute();
$result = $statement->get_result();

$evt_array = array(
    'name'        => 'event',
    'onchange'    => 'selChanged(this.name, this.value);',
    'cssid'       => 'event',
    'option_list' => array()
);

while ($row = $result->fetch_object()){
    $sel = "";
    if (!$event)
    {
        $event = $row->id;
    }

    if ($event == $row->id)
    {
        $sel = " selected='selected'";
    }

    $evt_array['option_list'][] = array('id' => $row->id, 'value' => $row->date.", ".$row->wo, 'selected' => $sel);
}

$sql = "SELECT * FROM wettkampf WHERE evtid=".$event;
$requests[] = $sql;
$statement = $db->prepare($sql);
$statement->execute();
$result = $statement->get_result();

$wk_array = array(
    'name'        => 'wk',
    'onchange'    => 'selChanged(this.name, this.value);',
    'cssid'       => 'competition',
    'option_list' => array()
);

while ($row = $result->fetch_object()){
    $sel = "";
    if ($wk == 0)
    {
        $wk = $row->id;
    }

    if ($wk == $row->id)
    {
        $sel = " selected='selected'";
    }

    $wk_array['option_list'][] = array('id' => $row->id, 'value' => $row->name ." (#".$row->id.")", 'selected' => $sel);
}

$sql = "SELECT distinct ak FROM starterliste WHERE compid=".$wk;
$requests[] = $sql;
$statement = $db->prepare($sql);
$statement->execute();
$result = $statement->get_result();

$ak_array = array(
    'name'        => 'ak',
    'onchange'    => 'selChanged(this.name, this.value);',
    'cssid'       => 'ak',
    'option_list' => array()
);

$ak_array['option_list'][] = array('id' => '', 'value' => 'Alle', 'selected' => '');

while ($row = $result->fetch_object()){
    $sel = "";

    if ($ak === $row->ak)
    {
        $sel = " selected='selected'";
    }

    $ak_array['option_list'][] = array('id' => $row->ak, 'value' => $row->ak, 'selected' => $sel);
}

/*
$db->query("SET @i=0");
$sql = "SELECT @i:=@i+1 as rank, s.startnum, s.name, s.verein, s.ak, z.zeit FROM starterliste s, zeiten z "
      ."WHERE s.startnum=z.startnum AND z.compid=".$wk." AND s.datum='".$event."'";
*/

$sql = "SELECT s.startnum, s.name, s.verein, s.ak, z.id, z.zeit FROM starterliste s, zeiten z "
      ."WHERE s.startnum=z.startnum AND z.compid=".$wk." AND s.compid=".$wk;
if ($ak != "")
{
    $sql .= " AND s.ak='".$ak."'";
}
// $sql .= " order by z.zeit";

$requests[] = $sql;
if ($statement = $db->prepare($sql))
{
    $statement->execute();
    $result    = $statement->get_result();

    while ($row = $result->fetch_object())
    {
        if (!array_key_exists($row->startnum, $data_array))
        {
            $data_array[$row->startnum] = array(
                'zid'   => $row->id,
                'id'    => $row->startnum,
                'name'  => $row->name,
                'team'  => $row->verein,
                'ak'    => $row->ak,
                'ltime' => 0,
                'times' => array()
            );
        }

        $data_array[$row->startnum]['times'][] = $row->zeit;
        $data_array[$row->startnum]['ltime']   = max($data_array[$row->startnum]['times']);
    }

    usort($data_array, 'cmpResData');
}

$lastTime       = "";
$rank           = 0;
$scrollto_shown = false;
$scrollto       = "";

$tab_array = array('res_rows' =>  array());

for ($i = 0; $i < count($data_array); $i++)
{
    if ($lastTime != $data_array[$i]['ltime'])
    {
        $rank = $i + 1;
    }

    $lastTime = $data_array[$i]['ltime'];

    $mark = false;

    if ($last_id && ($data_array[$i]['zid'] > $last_id))
    {
        $mark = true;
    }

    if ($mark === true)
    {
        if ($scrollto_shown === false)
        {
            $scrollto       = "id='scrollto' ";
            $scrollto_shown = true;
        }
    }
    else
    {
        $scrollto       = "";
    }

    $tab_array['res_rows'][] = array(
        'rank'      => $rank,
        'startno'   => $data_array[$i]['id'],
        'startname' => $data_array[$i]['name'],
        'club'      => $data_array[$i]['team'],
        'ak'        => $data_array[$i]['ak'],
        'time'      => $data_array[$i]['ltime'],
        'tdclass'   => ($mark ? " style='background-color: #ffe2e0'" : ""),
        'scrollto'  => $scrollto
    );
}

//------------------------------------------------------------------------------

$core = new Dwoo\Core();
try
{
    $core->setTemplateDir("./templates");
    $tpl  = new Dwoo\Template\File('select.tpl');
    $tpl->setIncludePath('./templates');

    $data = new Dwoo\Data();
    $data->assign('evt_sel', $core->get($tpl, $evt_array));
    $data->assign('comp_sel', $core->get($tpl, $wk_array));
    $data->assign('ak_sel', $core->get($tpl, $ak_array));

    $glob_data = new Dwoo\Data();
    $glob_data->assign('note', $note);
    $glob_data->assign('script', $jscript);
    $glob_data->assign('title', 'Ergebnisse');

    $content  = $core->get('result_sort.tpl', $data);
    $content .= $core->get('restab.tpl', $tab_array);

    $glob_data->assign('content', $content);
    echo $core->get('site.tpl', $glob_data);
}
catch (\Dwoo\Exception $e)
{
    echo "Error in ". $e->getFile().":".$e->getLine().": ".$e->getMessage();
}
?>