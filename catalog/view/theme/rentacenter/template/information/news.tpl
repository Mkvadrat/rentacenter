<?php echo $header; ?>

    <main class="main-news-in">

        <!-- start banner-under-header -->
        <div class="container-fluid black-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
						<p class="title-black-banner"><?php echo $heading_title; ?></p>
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
						</ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- end banner-under-header -->

        <!-- start list-car -->

        <div class="container">
            <div class="row">
                <div class="content-block">
                    <div class="col-md-9">
                        <div class="text-block">
                            <!--<p class="title-text"><?php echo $heading_title; ?></p>-->
							<?php echo $description; ?>
							<p><time datetime=""><?php echo $date_added; ?></time></p>
						</div>
					</div>	

					<?php if($related_news){ ?>
                    <div class="col-md-3">
                        <p class="title-text">Последние новости</p>
                        <ul class="last-news">
							<?php foreach ($related_news as $news) { ?>
                            <li>
                                <a href="<?php echo $news['view']; ?>">
                                    <p class="title"><?php echo $news['title']; ?></p>
                                    <time datetime=""><?php echo $news['date_added']; ?></time>
                                </a>
                            </li>
							<?php } ?>
                        </ul>
                    </div>
					<?php } ?>
                </div>
            </div>
        </div>
    </main>
	
<?php echo $footer; ?> 