<?php if (count($languages) > 1) { ?>
  <div class="language-list">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language-form">
        <select name="code" id="language">
        <?php foreach ($languages as $language) { ?>
          <?php if ($language['code'] == $code) { ?>
            <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
          <?php }else{ ?>
            <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
          <?php } ?>
        <?php } ?>
        </select>
  
      <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
  </div>
<?php } ?>

<script>
$(function() {
  $("#language").change(function() {
    $("#language-form").submit();
  });
});
</script>