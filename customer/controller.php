<?php
require_once ("../include/initialize.php");

$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
	case 'add' :
	doInsert();
	break;
	
	case 'edit' :
	doEdit();
	break;
	
	case 'eydit' :
		doEydit();
		break;

	case 'delete' :
	doDelete();
	break;

 

	case 'processorder' :
	processorder();
	break;

	case 'addwish' :
	addwishlist();
	break;

	case 'wishlist' :
	processwishlist();
	break;

	case 'photos' :
	doupdateimage();
	break;

	case 'changepassword' :
	doChangePassword();
	break;


	}

   
function doInsert(){
	global $mydb;
	if(isset($_POST['submit'])){


			// @$errofile = $_FILES['image']['error'];
			// @$type = $_FILES['image']['type'];
			// @$temp = $_FILES['image']['tmp_name'];
			// @$myfile =$_FILES['image']['name'];
		 // 	@$location="customer_image/".$myfile;
 
			// @$file=$_FILES['image']['tmp_name'];
			// @$image= addslashes(file_get_contents($_FILES['image']['tmp_name']));
			// @$image_name= addslashes($_FILES['image']['name']); 
			// @$image_size= getimagesize($_FILES['image']['tmp_name']);

			// if (@$_FILES["image"]["size"] > 5000000) {
			//     message("Your file is too large. The image cannot be uploaded. You can set or upload an image in your profile", "error");
			//     // $uploadOk = 0;
			// // }elseif ($image_size==FALSE ) {
			// // 	message("Uploaded file is not an image!", "error");
			// 	// redirect(web_root."index.php?page=6");
			// }else{
			// 		//uploading the file
			// 		move_uploaded_file($temp,"customer_image/" . $myfile);
			// 	}
						$customer = New Customer();
						// $customer->CUSTOMERID 		= $_POST['CUSTOMERID'];
						$customer->FNAME 			= $_POST['FNAME'];
						$customer->LNAME 			= $_POST['LNAME'];
						// $customer->MNAME 			= $_POST['MNAME'];
						// $customer->CUSHOMENUM 		= $_POST['CUSHOMENUM'];
						// $customer->STREETADD		= $_POST['STREETADD'];
						// $customer->BRGYADD 			= $_POST['BRGYADD'] ;			
						$customer->CITYADD  		= $_POST['CITYADD'];
						// $customer->PROVINCE 		= $_POST['PROVINCE'];
						// $customer->COUNTRY 			= $_POST['COUNTRY'];
						$customer->GENDER 			= $_POST['GENDER'];
					 	$customer->PHONE 			= $_POST['PHONE'];
                        // $customer->EMAILADD 			= $_POST['EMAILADD'];
						// $customer->ZIPCODE 			= $_POST['ZIPCODE'];
						// $customer->CUSPHOTO 		= $location;
						$customer->CUSUNAME			= $_POST['CUSUNAME'];
						$customer->CUSPASS			= sha1($_POST['CUSPASS']);	
						$customer->DATEJOIN 		= date('Y-m-d h-i-s');
						$customer->TERMS 			= 1;
						$customer->create();
   

						$email = trim($_POST['CUSUNAME']);
						$h_upass = sha1(trim($_POST['CUSPASS']));


						//it creates a new objects of member
					    $user = new Customer();
					    //make use of the static function, and we passed to parameters
					    $res = $user->cusAuthentication($email, $h_upass); 

					 
			 if($_POST['proid']==''){
			  echo "<script> alert('You are now successfully registered. It will redirect to your order details.'); </script>";
						redirect(web_root."index.php?q=product");
			 }else{
			 	$proid = $_POST['proid'];
			 	$id = $mydb->insert_id(); 
			 	$query ="INSERT INTO `tblwishlist` (`PROID`, `CUSID`, `WISHDATE`, `WISHSTATS`)  VALUES ('{$proid}','{$id}','".DATE('Y-m-d')."',0)";
			 	// mysql_query($query) or die(mysql_error());
				 $mydb->setQuery($query);
				 $mydb->executeQuery();
			 	 echo "<script> alert('You are now successfully registered. It will redirect to your profile.'); </script>";
						redirect(web_root."index.php?q=profile");
			 }
		 
		

	  }
	}
 
	function doEdit(){
		if(isset($_POST['save'])){


			
			$customer = New Customer();
			// $customer->CUSTOMERID 		= $_POST['CUSTOMERID'];
			$customer->FNAME 			= $_POST['FNAME'];
			$customer->LNAME 			= $_POST['LNAME'];
			// $customer->MNAME 			= $_POST['MNAME'];
			// $customer->CUSHOMENUM 		= $_POST['CUSHOMENUM'];
			// $customer->STREETADD		= $_POST['STREETADD'];
			// $customer->BRGYADD 			= $_POST['BRGYADD'] ;			
			$customer->CITYADD  		= $_POST['CITYADD'];
			// $customer->PROVINCE 		= $_POST['PROVINCE'];
			// $customer->COUNTRY 			= $_POST['COUNTRY'];
			$customer->GENDER 			= $_POST['GENDER'];
		 	$customer->PHONE 			= $_POST['PHONE'];
			//  $customer->EMAILADD 			= $_POST['EMAILADD'];
			// $customer->ZIPCODE 			= $_POST['ZIPCODE']; 
			$customer->CUSUNAME			= $_POST['CUSUNAME'];
			// $customer->CUSPASS			= sha1($_POST['CUSPASS']);	
			$customer->update($_SESSION['CUSID']);


			message("Accounts has been updated!", "success");
			redirect(web_root.'index.php?q=profile');
		}
	}

	function doEydit(){
		global $mydb; 
	
		if ($_GET['actions']=='confirm') {
			$status = 'Confirmed';    
			$remarks = 'Your order has been accepted.';
			$delivered = Date('Y-m-d');
		} elseif ($_GET['actions']=='pending') {
			$status = 'Pending'; 
			$remarks = 'Your order is on process.';
			$delivered = Date('Y-m-d');
		} elseif ($_GET['actions']=='deliver') {
			$status = 'On The Way';    
			$remarks = 'Your order is on the way.';
			$delivered = Date('Y-m-d');
		} elseif ($_GET['actions']=='receive') {
			$status = 'Received';    
			$remarks = 'Order has been already received.';
			$delivered = Date('Y-m-d');
		} elseif ($_GET['actions']=='cancel'){
			// Cancelling the order
			$status = 'Cancelled';
			$remarks = 'You cancelled your order.';
			$delivered = Date('Y-m-d');
	
			// Restore product quantities
			$query = "SELECT * FROM `tblorder` WHERE `ORDEREDNUM`=".$_GET['id'];
			$mydb->setQuery($query);
			$order_items = $mydb->loadResultList(); 
	
			foreach ($order_items as $item) {
				$sql_update_quantity = "UPDATE `tblproduct` SET `PROQTY` = `PROQTY` + {$item->ORDEREDQTY} WHERE `PROID` = {$item->PROID}";
				$mydb->setQuery($sql_update_quantity);
				$mydb->executeQuery();
			}
		}
	
		// Update order status
		$order = New Order();
		$order->STATS = $status;
		$order->pupdate($_GET['id']);
	
		// Update summary
		$summary = New Summary();
		$summary->ORDEREDSTATS = $status;
		$summary->ORDEREDREMARKS = $remarks;
		$summary->CLAIMEDADTE = $delivered;
		$summary->HVIEW = 0;
		$summary->update($_GET['id']);
	
		// Insert message
		$query = "SELECT * FROM `tblsummary` s ,`tblcustomer` c 
			WHERE s.`CUSTOMERID`=c.`CUSTOMERID` and ORDEREDNUM=".$_GET['id'];
		$mydb->setQuery($query);
		$cur = $mydb->loadSingleResult();
	
		$sql = "INSERT INTO `messageout` (`Id`, `MessageTo`, `MessageFrom`, `MessageText`) 
			VALUES (Null, '".$cur->PHONE."','Janno','FROM Bachelor of Science and Entrepreneurs : Your order has been '".$status. "'. The amount is '".$cur->PAYMENT. "')";
		$mydb->setQuery($sql);
		$mydb->executeQuery();
	
		// Insert messages for product owners
		$query = "SELECT * 
			FROM  `tblproduct` p,`tblorder` o,  `tblsummary` s
			WHERE  p.`PROID` = o.`PROID` 
			AND o.`ORDEREDNUM` = s.`ORDEREDNUM`  
			AND o.`ORDEREDNUM`=".$_GET['id'];
		$mydb->setQuery($query);
		$cur = $mydb->loadResultList(); 
		foreach ($cur as $result) {
			$sql = "INSERT INTO `messageout` (`Id`, `MessageTo`, `MessageFrom`, `MessageText`) 
				VALUES (Null, '".$result->OWNERPHONE."','Janno','FROM Bachelor of Science and Entrepreneurs : Your  product has been ordered'. The amount is '".$result->PAYMENT. "')";
			$mydb->setQuery($sql);
			$mydb->executeQuery();
		}
	
		message("One order has been ".$summary->ORDEREDSTATS."!", "success");
		redirect(web_root.'index.php?q=profile');
	}
	
	function doDelete(){

		if(isset($_SESSION['U_ROLE'])=='Customer'){

			if (isset($_POST['selector'])==''){
			message("Select the records first before you delete!","error");
			redirect(web_root.'index.php?page=9');
			}else{
		
			$id = $_POST['selector'];
			$key = count($id);

			for($i=0;$i<$key;$i++){ 

			$order = New Order();
			$order->delete($id[$i]);
 
			message("Order has been Deleted!","info");
			redirect(web_root."index.php?q='product'"); 


		} 


		}
	}else{

		if (isset($_POST['selector'])==''){
			message("Select the records first before you delete!","error");
			redirect('index.php');
			}else{

			$id = $_POST['selector'];
			$key = count($id);

			for($i=0;$i<$key;$i++){ 

			$customer = New Customer();
			$customer->delete($id[$i]);

			$user = New User();
			$user->delete($id[$i]);

			message("Customer has been Deleted!","info");
			redirect('index.php');

			}
		}

	}
		
	}

	 
		function processorder(){

		 
 
		//	$_SESSION['ORDEREDNUM'] = $_POST['ORDEREDNUM'];
			 
			
		 	// $autonumber = New Autonumber();
 			// $res = $autonumber->set_autonumber('ordernumber');


			$count_cart = count($_SESSION['gcCart']);
             for ($i=0; $i < $count_cart  ; $i++) { 
 
			$order = New Order();
			$order->PROID		    = $_SESSION['gcCart'][$i]['productid']; 
			$order->ORDEREDQTY		= $_SESSION['gcCart'][$i]['qty'];
			$order->ORDEREDPRICE	= $_SESSION['gcCart'][$i]['price'];   
			$order->ORDEREDNUM		= $_POST['ORDEREDNUM']; 
	     	$order->create(); 
 
		  	$product = New Product();			 
			$product->qtydeduct($_SESSION['gcCart'][$i]['productid'],$_SESSION['gcCart'][$i]['qty']); 


			$summary = New Summary();
			$summary->ORDEREDDATE 	= date("Y-m-d h:i:s");
			$summary->CUSTOMERID		= $_SESSION['CUSID'];
			$summary->ORDEREDNUM  	= $_POST['ORDEREDNUM'];  
			$summary->DELFEE  		= $_POST['PLACE']; 
			$summary->PAYMENTMETHOD	= $_POST['paymethod'];
			$summary->PAYMENT 		= $_POST['alltot'];
			$summary->ORDEREDSTATS 	= 'Pending';
			$summary->CLAIMEDDATE		= $_POST['CLAIMEDDATE'];
			$summary->ORDEREDREMARKS 	= 'Your order is on process.';
			$summary->HVIEW 			= 0	;
			$summary->create();
		  }

     


		$autonumber = New Autonumber();
		$autonumber->auto_update('ordernumber');

 
		unset($_SESSION['gcCart']);  
		unset($_SESSION['orderdetails']); 

		message("Order created successfully!", "success"); 		 
		redirect(web_root."index.php?q=profile");

		}
			 


	function processwishlist(){
		if(isset($_GET['wishid'])){

		  $query ="UPDATE `tblwishlist` SET `WISHSTATS`=1  WHERE `WISHLISTID`=" .$_GET['wishid'];
		 $res =  mysql_query($query) or die(mysql_error());
		 if (isset($res)){
		 		message("Product has been removed in your wishlist", "success"); 		 
			redirect(web_root."index.php?q=profile");
		 }

		

		}
		

		}
			 

	function addwishlist(){
		global $mydb;
			$proid = $_GET['proid'];
			 	$id =$_SESSION['CUSID'];

	 $query="SELECT * FROM `tblwishlist` WHERE  CUSID=".$id." AND `PROID` ="  .$proid ;
	 $mydb->setQuery($query);
	 $result = $mydb->executeQuery();
	 var_dump($query);exit;
	 $maxrow = $mydb->num_rows($result);
	 // $row = mysql_fetch_assoc($result);
	
	if($maxrow>0){
				message("Product is already added to your wishlist", "error"); 		 
			redirect(web_root."index.php?q=profile"); 
		}else{
			$query ="INSERT INTO `tblwishlist` (`PROID`, `CUSID`, `WISHDATE`, `WISHSTATS`)  VALUES ('{$proid}','{$id}','".DATE('Y-m-d')."',0)";
			$mydb->setQuery($query);
			$mydb->executeQuery();
			  	// mysql_query($query) or die(mysql_error());
			 
	 	message("Product has been added to your wishlist", "success"); 		 
			redirect(web_root."index.php?q=profile"); 
		}
			 
			 
	 

		}
		function doupdateimage(){
 
			$errofile = $_FILES['photo']['error'];
			$type = $_FILES['photo']['type'];
			$temp = $_FILES['photo']['tmp_name'];
			$myfile =$_FILES['photo']['name'];
		 	$location="customer_image/".$myfile;


		if ( $errofile > 0) {
				message("No Image Selected!", "error");
				redirect(web_root. "index.php?q=profile");
		}else{
	 
				@$file=$_FILES['photo']['tmp_name'];
				@$image= addslashes(file_get_contents($_FILES['photo']['tmp_name']));
				@$image_name= addslashes($_FILES['photo']['name']); 
				@$image_size= getimagesize($_FILES['photo']['tmp_name']);

			if ($image_size==FALSE ) {
				message(web_root. "Uploaded file is not an image!", "error");
				redirect(web_root. "index.php?q=profile");
			}else{
					//uploading the file
					move_uploaded_file($temp,"customer_image/" . $myfile);
		 	
					 
						$customer = New Customer(); 
						$customer->CUSPHOTO 		= $location; 
						$customer->update($_SESSION['CUSID']); 

						redirect(web_root. "index.php?q=profile");
						 
							
					}
			}
			 
		}


		function doChangePassword(){
			if (isset($_POST['save'])) {
				# code...
				$customer = New Customer(); 
				$customer->CUSPASS			= sha1($_POST['CUSPASS']);	
				$customer->update($_SESSION['CUSID']);


			message("Password has been updated!", "success");
			redirect(web_root.'index.php?q=profile');
			}
		}
 
 
?>