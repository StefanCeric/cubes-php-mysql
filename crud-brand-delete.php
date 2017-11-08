<?php
session_start();

require_once __DIR__ . '/models/m_brands.php';

if (empty($_GET['id'])) {
    die('Prosledi ID!');
}

$id = (int) $_GET['id'];


//prethodna verzija pa nova sa uvezanim konkretnim modelom za brands
//$query = "SELECT * FROM brands WHERE id = '" . dbEscape($id) . "' ";
//$brand = dbFetchOne($query);
$brand = brandsFetchOneById($id);

if (empty($brand)) {
    die('Trazeni brand ne postoji!');
}

if (isset($_POST["task"]) && $_POST["task"] == "delete") {
    
//prethodna verzija pa nova sa uvezanim konkretnim modelom za brands
//    $query = "DELETE FROM brands WHERE id = '" . mysqli_real_escape_string($link, $brand['id']) . "' ";    
//    $result = mysqli_query($link, $query);
//           if ($result === false) {
//               die('MySQL error: ' . mysqli_error($link));
//           }
      brandsDeleteOneById($id);
           
      
           header ('Location: /crud-brand-list.php');
           die();
    
}


require_once __DIR__ .  '/views/layout/header.php';
require_once __DIR__ .  '/views/templates/t_crud-brand-delete.php';
require_once __DIR__ .  '/views/layout/footer.php';

