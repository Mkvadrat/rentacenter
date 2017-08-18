<?php echo $header; ?>

  <main class="main-404">

      <!-- start banner-under-header -->
      <div class="container-fluid black-banner">
          <div class="container">
              <div class="row">
                  <div class="col-md-12">
                    <h1 class="title-black-banner"><?php echo $heading_title; ?></h1>
                    <ul class="bread-crumbs">
                    <?php			
                      $count = count($breadcrumbs);
                      $i=1;
                      foreach ($breadcrumbs as $breadcrumb) {
                        if($i!=$count){
                    ?>
                          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php echo ' ' . $breadcrumb['separator']; ?></li>
                    <?php
                        }else{
                          echo '<li><span> '.$breadcrumb['text'] . '</span></li>'; 
                        }		
                        $i++;
                      } 
                    ?>
                  </div>
              </div>
          </div>
      </div>

      <!-- end banner-under-header -->

      <!-- start list-car -->

      <div class="container">
          <div class="row">
              <div class="content-block">
                  <div class="col-md-12 pad-left pad-right">
                      <div class="text-block">
                          <p class="title-text"><?php echo $heading_title; ?></p>
                          <p><?php echo $text_message; ?></p>
                      </div>
                  </div>
                  <p class="text-center"><a href="<?php echo $continue; ?>" class="button-yellow"><?php echo $button_continue; ?></a></p>
              </div>
          </div>
      </div>
  </main>
  
<?php echo $footer; ?>