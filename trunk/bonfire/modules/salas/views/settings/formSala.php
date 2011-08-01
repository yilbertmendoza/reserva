<?php $this->load->view('salas/settings/header'); ?>

<div id="content" class="view">
		<div class="scrollable" id="ajax-content">

				<div class="row">
				
				<?php if (validation_errors()) : ?>
                    <div class="notification error">
	                <?php echo validation_errors(); ?>
                    </div>
                <?php endif; ?>
				
				<form name="formSala" id="formSala" method="post">
				<input type="hidden" name="idsala" id="idsala" value="<?php echo (isset($sala['id_sala'])) ? $sala['id_sala'] : set_value('idsala');?>">
				
				<div>
				    <fieldset><label>Nombre sala</label>
				        <input type="text" name="nombre" id="nombre" value="<?php echo (isset($sala['nombre'])) ? $sala['nombre'] : set_value('nombre');?>" >
				    </fieldset>
				</div>
				
				<div>
				    <fieldset><label>Cantidad asientos</label>
				        <input type="text" name="asientos" id="asientos" value="<?php echo (isset($sala['asientos'])) ? $sala['asientos'] : set_value('asientos'); ?>" >
				    </fieldset>
				</div>
				
				<div>
				    <fieldset><label>Descripción</label>
				        <input type="text" name="descripcion" id="descripcion" value="<?php echo (isset($sala['descripcion'])) ? $sala['descripcion'] : set_value('descripcion'); ?>" >
				    </fieldset>
				</div>
				
				
				<div class="submit"><input type="submit" name="guardar" value="Guardar"></div>
				</form>
				
				
				</div>
				
		</div>	<!-- /scrollable -->
	</div>	<!-- /content -->
</div>	<!-- /vsplit -->
<?php 
print_r($_POST);
?>