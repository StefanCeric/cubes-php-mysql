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


//ovde se prihvataju vrednosti polja, popisati sve kljuceve i pocetne vrednosti
$formData = array(
	'title' => $tag['title'],
);

//ovde se smestaju greske koje imaju polja u formi
$formErrors = array();


//uvek se prosledjuje jedno polje koje je indikator da su podaci poslati sa forme
//odnosno da je korisnik pokrenuo neku akciju
if (isset($_POST["task"]) && $_POST["task"] == "save") {
	
	/*********** filtriranje i validacija polja ****************/
    if (isset($_POST["title"]) && $_POST["title"] !== '') {
		//Dodavanje parametara medju podatke u formi
		$formData["title"] = $_POST["title"];
		
		//Filtering 1
		$formData["title"] = trim($formData["title"]);

		
	} else {//Ovaj else ide samo ako je polje obavezno
		$formErrors["title"][] = "Polje title je obavezno";
	}

	/*********** filtriranje i validacija polja ****************/
	
	
	//Ukoliko nema gresaka 
	if (empty($formErrors)) {
		//Uradi akciju koju je korisnik trazio
           
        tagsUpdateOneById($tag['id'], $formData);
            
            
           header ('Location: /crud-tag-list.php');
           die();
           
        }
	
}


require_once __DIR__ .  '/views/layout/header.php';
require_once __DIR__ .  '/views/templates/t_crud-tag-edit.php';
require_once __DIR__ .  '/views/layout/footer.php';



