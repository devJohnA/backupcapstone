<?php
require_once '../../admin/dbcon/conn.php';

$search_query = isset($_GET['search']) ? $_GET['search'] : '';

$query = "SELECT * FROM orderpos";
if (!empty($search_query)) {
    $search_query = mysqli_real_escape_string($conn, $search_query);
    $query .= " WHERE orNumber LIKE '%$search_query%'";
}

$result = mysqli_query($conn, $query);
?>

<div class="tab-content" id="orders-table-tab-content">
    <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
        <div class="app-card app-card-orders-table shadow-sm mb-5">
            <div class="app-card-body">
                <div class="search-container">
                    <form action="" method="GET">
                        <input type="text" name="search" class="form-control" placeholder="Enter OR Number"
                            value="<?php echo htmlspecialchars($search_query); ?>">
                        <button type="submit" class="btn btn-primary ml-2">Search</button>
                    </form>
                </div>
                <div class="table-responsive">
                    <table class="table app-table-hover mb-0 text-left">
                        <thead>
                            <tr>
                                <th class="cell">OR Number</th>
                                <th class="cell">Products and Quantity</th>
                                <th class="cell">Total Price</th>
                                <th class="cell">Order Date</th>
                            </tr>
                        </thead>
                        <tbody id="orderTableBody">
                            <?php
                            if (mysqli_num_rows($result) > 0) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "<tr>";
                                    echo "<td>" . htmlspecialchars($row['orNumber']) . "</td>";
                                    echo "<td>" . htmlspecialchars($row['productDetails']) . "</td>";
                                    echo "<td> &#8369;" . htmlspecialchars($row['totalPrice']) . "</td>";
                                    echo "<td>" . htmlspecialchars($row['orderDate']) . "</td>";
                                    echo "</tr>";
                                }
                            } else {
                                echo "<tr><td colspan='3' class='text-center'>No data available</td></tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>