<?php
session_start();

require_once __DIR__ . '/models/m_users.php';

if (!isUserLoggedIn()) {
    header('Location: /login.php');
    die();
}

require_once __DIR__ . '/models/m_tags.php';

if (empty($_GET['id'])) {
    die('Prosledi ID!');
}

$id = (int) $_GET['id'];

$tag = tagsFetchOneById($id);

if (empty($tag)) {
    die('Trazeni tag ne postoji!');
}

if (isset($_POST["task"]) && $_POST["task"] == "delete") {
    
      tagsDeleteOneById($id);
           
      
           header ('Location: /crud-tag-list.php');
           die();
    
}


require_once __DIR__ .  '/views/layout/header.php';
require_once __DIR__ .  '/views/templates/t_crud-tag-delete.php';
require_once __DIR__ .  '/views/layout/footer.php';

