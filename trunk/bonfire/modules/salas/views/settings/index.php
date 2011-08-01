<?php $this->load->view('salas/settings/header'); ?>

<div id="content" class="view">
		<div class="scrollable" id="ajax-content">

				<div class="row">
<table>
<tr>
    <td><b>Nombre sala</b></td>
    <td><b>Asientos</b></td>
    <td><b>Descripcion</b></td>
    <td><b>Estado</b></td>
    <td><b>Editar</b></td>
</tr>
<?php foreach ($listasala as $value): ?>
<tr>
    <td><?php echo $value->nombre ?></td>
    <td><?php echo $value->asientos ?></td>
    <td><?php echo $value->descripcion ?></td>
    <td><?php echo (1 == $value->descripcion) ? 'Habilitada' : 'Deshabilitada'; ?></td>
    <td>
        <form name="editar" id="editar" method="post" action="<?php echo base_url()?>index.php/admin/settings/salas/formSala">
            <input type="hidden" name="sala" value="<?php echo $value->id_sala ?>">
            <div class="submit"><input type="submit" name="editar" value="Editar sala"></div>
        </form>
    </td>
        
</tr>

<?php endforeach;?>
</table>

</div>
				
		</div>	<!-- /scrollable -->
	</div>	<!-- /content -->
</div>	<!-- /vsplit -->
