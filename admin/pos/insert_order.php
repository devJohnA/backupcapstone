<?php
require_once '../../admin/dbcon/conn.php';

$orNumber = $_POST['orNumber'];
$productDetails = $_POST['productDetails'];
$totalPrice = $_POST['totalPrice'];

// Start transaction
$conn->begin_transaction();

try {
    // Insert order
    $stmt = $conn->prepare("INSERT INTO orderpos (orNumber, productDetails, totalPrice) VALUES (?, ?, ?)");
    $stmt->bind_param("ssd", $orNumber, $productDetails, $totalPrice);
    
    if ($stmt->execute()) {
        // Parse product details
        $products = explode(', ', $productDetails);
        
        // Update stock for each product
        foreach ($products as $product) {
            list($productName, $quantity) = explode(' ', $product, 2);
            
            $updateStmt = $conn->prepare("UPDATE stocks SET productStock = productStock - ? WHERE productName = ?");
            $updateStmt->bind_param("is", $quantity, $productName);
            $updateStmt->execute();
            $updateStmt->close();
        }
        
        // Commit transaction
        $conn->commit();
        echo "Order inserted and stock updated successfully";
    } else {
        throw new Exception($stmt->error);
    }
} catch (Exception $e) {
    // Rollback transaction on error
    $conn->rollback();
    echo "Error: " . $e->getMessage();
} finally {
    $stmt->close();
    $conn->close();
}
?>