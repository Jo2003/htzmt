<select name='{$name}' class='form-control' onchange='{$onchange}' id='{$cssid}'>
{loop $option_list}<option value='{$id}'{$selected}>{$value}</option>
{/loop}
</select>