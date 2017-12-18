<div class="row">
<div class='col-sm-12'>
<table class="table table-striped table-bordered table-hover">
<thead class="thead-dark">
<tr>
<th>#</th>
<th>St.Nr</th>
<th>Name</th>
<th>Zeit</th>
</tr>
</thead>
<tbody>
{loop $res_rows}
<tr>
<td{$tdclass}>{$rank}</td>
<td{$tdclass}>{$startno}</td>
<td{$tdclass}>
    <span {$scrollto}data-html="true" class='text-primary' data-toggle="tooltip"
        title="<b class='text-primary'>Club:</b> {$club}<br /><b class='text-primary'>AK:</b> {$ak}">{$startname}
    </span>
</td>
<td{$tdclass}>{$time}</td>
</tr>
{/loop}
</tbody>
</table>
</div>
</div>