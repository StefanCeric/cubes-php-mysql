<?php

$link = mysqli_connect('127.0.0.1', 'cubes', 'cubes', 'cubesphp');

if ($link === false) {
    die('MySQL ERROR: ' . mysqli_connect_error());
}

$title = 'Group Title';

$query = "INSERT INTO groups (title) VALUES ('" . mysqli_real_escape_string($link, $title)  . "')";

$result = mysqli_query($link, $query);

if ($result === false) {
    die('MySQL Errors: ' . mysqli_error($link));
}

$newId = mysqli_insert_id($link);

echo 'New group has been added with ID: ' . $newId;