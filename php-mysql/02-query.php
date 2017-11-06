<?php

// Postoje funkcije koje rade sa resursima konekta i one sa resursima rezultujucih tabela

$link = mysqli_connect('127.0.0.1', 'cubes', 'cubes', 'cubesphp');

if ($link === false) {
    die('MySQL ERROR: ' . mysqli_connect_error());
}

$result = mysqli_query($link, 'SELECT * FROM `products`');

if ($result === false) {
    die('MySQL ERROR: ' . mysqli_error($link));
}

$products = mysqli_fetch_all($result, MYSQLI_ASSOC);

print_r($products);