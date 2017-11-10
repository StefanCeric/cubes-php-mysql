<?php
session_start();

require_once __DIR__ . '/models/m_users.php';

if (!isUserLoggedIn()) {
    header('Location: /login.php');
    die();
}

require_once __DIR__ . '/models/m_brands.php';

//sa novim modelom pozvanim gore je nepotrebno...
//$link = mysqli_connect('127.0.0.1', 'cubes', 'cubes', 'cubesphp');
//
//if ($link === false) {
//    die('MySQL ERROR: ' . mysqli_connect_error());
//}


//ovde se prihvataju vrednosti polja, popisati sve kljuceve i pocetne vrednosti
$formData = array(
	'title' => '',
        'website_url' => '',
);

//ovde se smestaju greske koje imaju polja u formi
$formErrors = array();


//uvek se prosledjuje jedno polje koje je indikator da su podaci poslati sa forme
//odnosno da je korisnik pokrenuo neku akciju
if (isset($_POST["task"]) && $_POST["task"] == "insert") {
	
	/*********** filtriranje i validacija polja ****************/
    if (isset($_POST["title"]) && $_POST["title"] !== '') {
		//Dodavanje parametara medju podatke u formi
		$formData["title"] = $_POST["title"];
		
		//Filtering 1
		$formData["title"] = trim($formData["title"]);

		
	} else {//Ovaj else ide samo ako je polje obavezno
		$formErrors["title"][] = "Polje title je obavezno";
	}
    
    if (isset($_POST["website_url"]) && $_POST["website_url"] !== '') {
		//Dodavanje parametara medju podatke u formi
		$formData["website_url"] = $_POST["website_url"];
		
		//Filtering 1
		$formData["website_url"] = trim($formData["website_url"]);

    }
	/*********** filtriranje i validacija polja ****************/
	
	
	//Ukoliko nema gresaka 
	if (empty($formErrors)) {
		//Uradi akciju koju je korisnik trazio
            
//           $query = "INSERT INTO brands (title, website_url) VALUES" ;
//           $query .= "('" . mysqli_real_escape_string($link, $formData['title']) . "' , '" . mysqli_real_escape_string($link, $formData['website_url']) . "')";
//           
//           
//           
//           $result = mysqli_query($link, $query);
//           if ($result === false) {
//               die('MySQL error: ' . mysqli_error($link));
//           }
           
        $newBrandId = brandsInsertOne($formData);
            
           header ('Location: /crud-brand-list.php');
           die();
           
        }
	
}

require_once __DIR__ .  '/views/layout/header.php';
require_once __DIR__ .  '/views/templates/t_crud-brand-insert.php';
require_once __DIR__ .  '/views/layout/footer.php';

