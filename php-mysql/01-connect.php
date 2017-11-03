<?php


// mysqli - funkcije koje pocinju sa mysqli_  - ima i proceduralnu i objektno orijentisanu varijantu
// pdo - objektno orijentisana Biblioteka

//konektovanje na bazu - vraca resurs koji posle koristimo u mysqli funkcijama ili vraca false ako se nije konektovao
$link = mysqli_connect('127.0.0.1', 'cubes', 'cubes', 'cubesphp');

if ($link === false) {
    die('MySQL ERROR: ' . mysqli_connect_error());
}