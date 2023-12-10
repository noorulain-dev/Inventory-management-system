<?php  
session_start();

if (isset($_SESSION['id'])) {
    if(isset($_POST['fname']) && isset($_POST['uname']) && isset($_POST['phone_number'])){
        include "../db_conn.php";

        $fname = $_POST['fname'];
        $_SESSION['fname'] = $_POST['fname'];
        $uname = $_POST['uname'];
        $phone_number = $_POST['phone_number']; // Capture phone number
        $old_pp = $_POST['old_pp'];
        $id = $_SESSION['id'];

        if (empty($fname)) {
            $em = "Full name is required";
            header("Location: ../edit.php?error=$em");
            exit;
        } else if (empty($uname)) {
            $em = "User name is required";
            header("Location: ../edit.php?error=$em");
            exit;
        } else if (empty($phone_number)) {
            $em = "Phone number is required";
            header("Location: ../edit.php?error=$em");
            exit;
        } else {

      if (isset($_FILES['pp']['name']) AND !empty($_FILES['pp']['name'])) {
         
        
         $img_name = $_FILES['pp']['name'];
         $tmp_name = $_FILES['pp']['tmp_name'];
         $error = $_FILES['pp']['error'];
         
         if($error === 0){
            $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
            $img_ex_to_lc = strtolower($img_ex);

            $allowed_exs = array('jpg', 'jpeg', 'png');
            if(in_array($img_ex_to_lc, $allowed_exs)){
               $new_img_name = uniqid($uname, true).'.'.$img_ex_to_lc;
               $img_upload_path = '../upload/'.$new_img_name;
               // Delete old profile pic
               $old_pp_des = "../upload/$old_pp";
               if(unlink($old_pp_des)){
               	  // just deleted
               	  move_uploaded_file($tmp_name, $img_upload_path);
               }else {
                  // error or already deleted
               	  move_uploaded_file($tmp_name, $img_upload_path);
               }
               
               $_SESSION['image'] == $new_img_name;

               // update the Database
               $sql = "UPDATE users 
                       SET first_name=?, username=?, pp=?
                       WHERE id=?";
               $stmt = $conn->prepare($sql);
               $stmt->execute([$fname, $uname, $new_img_name, $id]);
               $_SESSION['fname'] = $fname;
               header("Location: ../edit.php?success=Your account has been updated successfully");
                exit;
            }else {
               $em = "You can't upload files of this type";
               header("Location: ../edit.php?error=$em&$data");
               exit;
            }
         }else {
            $em = "unknown error occurred!";
            header("Location: ../edit.php?error=$em&$data");
            exit;
         }

        
      } else {
         $sql = "UPDATE users SET first_name=?, username=?, phone_number=? WHERE id=?";
         $stmt = $conn->prepare($sql);
         $stmt->execute([$fname, $uname, $phone_number, $id]); // Include phone number in update

         header("Location: ../edit.php?success=Your account has been updated successfully");
         exit;
     }
    }


}else {
	header("Location: ../edit.php?error=error");
	exit;
}


}else {
	header("Location: login.php");
	exit;
} 

