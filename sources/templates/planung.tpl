<h2>1. Wo?</h2>
<form action='{$self}' method='post'>
<input type='hidden' name='action' value='new_event' />
<div class="form-group row">
<div class='col-sm-4'>
<label for="date" class="col-form-label">Datum:</label>
</div>
<div class='col-sm-8'>
<input type='text' name='date' value='{$date}' class='form-control' placeholder='Format: dd.MM.YYYY' id='date' />
</div>
</div>
<div class="form-group row">
<div class='col-sm-4'>
<label for="wo" class="col-form-label">Ort:</label>
</div>
<div class='col-sm-8'>
<input type='text' name='wo' value='{$wo}' class='form-control' id='wo' />
</div>
</div>
<div class="form-group row">
<div class='col-sm-12 text-center'>
<input type='reset' name='reset' value='Rücksetzen' class="btn btn-secondary" />
<input type='submit' name='submit' value='Speichern' class="btn btn-primary" />
</div>
</div>
</form>
<br /> <br />
<h2>2. Was?</h2>
<form action='{$self}' method='post'>
<input type='hidden' name='action' value='new_comp' />
<div class="form-group row">
<div class='col-sm-4'>
<label for="event" class="col-form-label">Veranstaltung:</label>
</div>
<div class='col-sm-8'>
{$evt_sel}
</div>
</div>
<div class="form-group row">
<div class='col-sm-4'>
<label for="comp" class="col-form-label">Wettkampf:</label>
</div>
<div class='col-sm-8'>
<input type='text' name='comp' value='{$comp}' class='form-control' id='comp' />
</div>
</div>
<div class="form-group row">
<div class='col-sm-12 text-center'>
<input type='reset' name='reset' value='Rücksetzen' class="btn btn-secondary" />
<input type='submit' name='submit' value='Speichern' class="btn btn-primary" />
</div>
</div>
</form>
<br /> <br />
<h2>3. Starterliste</h2>
<form action='{$self}' method='post' enctype='multipart/form-data'>
<input type='hidden' name='action' value='start_list' />
<input type="hidden" name="MAX_FILE_SIZE" value="512000" />
<div class="form-group row">
<div class='col-sm-4'>
<label for="event" class="col-form-label">Veranstaltung:</label>
</div>
<div class='col-sm-8'>
{$evt2_sel}
</div>
</div>
<div class="form-group row">
<div class='col-sm-4'>
<label for="file" class="col-form-label">Starterliste:</label>
</div>
<div class='col-sm-8'>
<input type='file' name='start_list_file' value='' class='form-control' id='file' accept=".csv, .txt, text/*" />
</div>
</div>
<div class="form-group row">
<div class='col-sm-12 text-center'>
<input type='reset' name='reset' value='Rücksetzen' class="btn btn-secondary" />
<input type='submit' name='submit' value='Speichern' class="btn btn-primary" />
</div>
</div>
</form>