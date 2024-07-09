<?php

if (!isset($_SESSION['USERID'])) {

  redirect(web_root . "admin/index.php");

}

?>

<?php

$query = "SELECT * FROM tblorder";

$mydb->setQuery($query);

$cur = $mydb->executeQuery();

$rowscount = $mydb->num_rows($cur);

$res = isset($rowscount) ? $rowscount : 0;



if ($res > 0) {

  $order = '<span style="color:black;">' . $res . '</span>';

} else {

  $order = '<span> ' . $res . '</span>';

}

?>

<?php

$query = "SELECT * FROM tblcustomer";

$mydb->setQuery($query);

$cur = $mydb->executeQuery();

$rowscount = $mydb->num_rows($cur);

$res = isset($rowscount) ? $rowscount : 0;



if ($res > 0) {

  $customer = '<span style="color:black;">' . $res . '</span>';

} else {

  $customer = '<span> ' . $res . '</span>';

}

?>

<?php

$query = "SELECT * FROM tblproduct";

$mydb->setQuery($query);

$cur = $mydb->executeQuery();

$rowscount = $mydb->num_rows($cur);

$res = isset($rowscount) ? $rowscount : 0;



if ($res > 0) {

  $product = '<span style="color:black;">' . $res . '</span>';

} else {

  $product = '<span> ' . $res . '</span>';

}

?>

<?php

$query = "SELECT * FROM tblsummary WHERE ORDEREDSTATS = 'Received'";

$mydb->setQuery($query);

$cur = $mydb->executeQuery();

$rowscount = $mydb->num_rows($cur);

$res = isset($rowscount) ? $rowscount : 0;



if ($res > 0) {

  $receive = '<span style="color:black;">' . $res . '</span>';

} else {

  $receive = '<span> ' . $res . '</span>';

}

?>


<?php

$user = new User();

$singleuser = $user->single_user($_SESSION['USERID']);



?>



<div class="row g-4 mb-4">
    <div class="col-6 col-lg-3">
        <div class="app-card app-card-stat shadow-sm h-100">
            <div class="app-card-body p-3 p-lg-4">
                <h4 class="stats-type mb-1">Total Sales</h4>
                <div class="stats-figure">$12,628</div>
                <div class="stats-meta text-success">
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-up" fill="currentColor"
                        xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                            d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z" />
                    </svg> 20%
                </div>
            </div>
            <!--//app-card-body-->
            <a class="app-card-link-mask" href="#"></a>
        </div>
        <!--//app-card-->
    </div>
    <!--//col-->
    <!-- <div class="col-6 col-lg-3">
        <div class="app-card app-card-stat shadow-sm h-100">
            <div class="app-card-body p-3 p-lg-4">
                <h4 class="stats-type mb-1">Number of Customers</h4>
                <div class="stats-figure"><?php echo $customer; ?></div>
            </div>

            <a class="app-card-link-mask" href="<?php echo web_root; ?>admin/customers/index.php"></a>
        </div>
    </div> -->

    <div class="col-6 col-lg-3">
        <div class="app-card app-card-stat shadow-sm h-100">
            <div class="app-card-body p-3 p-lg-4">
                <h4 class="stats-type mb-1">Number of Products</h4>
                <div class="stats-figure"><?php echo $product; ?></div>
            </div>

            <a class="app-card-link-mask" href="<?php echo web_root; ?>admin/products/index.php"></a>
        </div>
    </div>

    <div class="col-6 col-lg-3">
        <div class="app-card app-card-stat shadow-sm h-100">
            <div class="app-card-body p-3 p-lg-4">
                <h4 class="stats-type mb-1">Number of Orders</h4>
                <div class="stats-figure"><?php echo $order; ?></div>
            </div>

            <a class="app-card-link-mask" href="<?php echo web_root; ?>admin/orders/index.php"></a>
        </div>
    </div>

    <div class="col-6 col-lg-3">
        <div class="app-card app-card-stat shadow-sm h-100">
            <div class="app-card-body p-3 p-lg-4">
                <h4 class="stats-type mb-1">Received Orders</h4>
                <div class="stats-figure"><?php echo $receive; ?></div>
            </div>

            <a class="app-card-link-mask" href="<?php echo web_root; ?>admin/orders/index.php"></a>
        </div>
    </div>
</div>
<div class="row g-4 mb-4">
    <div class="col-12 col-lg-6">
        <div class="app-card app-card-chart h-100 shadow-sm">
            <div class="app-card-header p-3 border-0">
                <h4 class="app-card-title">Pie Chart Demo</h4>
            </div>
            <!--//app-card-header-->
            <div class="app-card-body p-4">
                <div class="chart-container">
                    <canvas id="chart-pie"></canvas>
                </div>
            </div>
            <!--//app-card-body-->
        </div>
        <!--//app-card-->
    </div>
    <!--//col-->
    <div class="col-12 col-lg-6">
        <div class="app-card app-card-chart h-100 shadow-sm">
            <div class="app-card-header p-3 border-0">
                <h4 class="app-card-title">Doughnut Chart Demo</h4>
            </div>
            <!--//app-card-header-->
            <div class="app-card-body p-4">
                <div class="chart-container">
                    <canvas id="chart-doughnut"></canvas>
                </div>
            </div>
            <!--//app-card-body-->
        </div>
        <!--//app-card-->
    </div>
    <!--//col-->
</div>
<div class="row g-4 mb-4">
    <div class="col-12 col-lg-6">
        <div class="app-card app-card-chart h-100 shadow-sm">
            <div class="app-card-header p-3">
                <div class="row justify-content-between align-items-center">
                    <div class="col-auto">
                        <h4 class="app-card-title">Line Chart Example</h4>
                    </div>
                    <!--//col-->
                    <div class="col-auto">
                        <div class="card-header-action">
                            <a href="charts.html">More charts</a>
                        </div>
                        <!--//card-header-actions-->
                    </div>
                    <!--//col-->
                </div>
                <!--//row-->
            </div>
            <!--//app-card-header-->
            <div class="app-card-body p-3 p-lg-4">
                <div class="mb-3 d-flex">
                    <select class="form-select form-select-sm ms-auto d-inline-flex w-auto">
                        <option value="1" selected>This week</option>
                        <option value="2">Today</option>
                        <option value="3">This Month</option>
                        <option value="3">This Year</option>
                    </select>
                </div>
                <div class="chart-container">
                    <canvas id="canvas-linechart"></canvas>
                </div>
            </div>
            <!--//app-card-body-->
        </div>
        <!--//app-card-->
    </div>
    <!--//col-->
    <div class="col-12 col-lg-6">
        <div class="app-card app-card-chart h-100 shadow-sm">
            <div class="app-card-header p-3">
                <div class="row justify-content-between align-items-center">
                    <div class="col-auto">
                        <h4 class="app-card-title">Bar Chart Example</h4>
                    </div>
                    <div class="col-auto">
                        <div class="card-header-action">
                            <a href="charts.html">More charts</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="app-card-body p-3 p-lg-4">
                <div class="mb-3 d-flex">
                    <select class="form-select form-select-sm ms-auto d-inline-flex w-auto">
                        <option value="1" selected>This week</option>
                        <option value="2">Today</option>
                        <option value="3">This Month</option>
                        <option value="3">This Year</option>
                    </select>
                </div>
                <div class="chart-container">
                    <canvas id="canvas-barchart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>