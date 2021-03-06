<?php

require_once __DIR__ . '/m_database.php';

/**
 * 
 * @return array Aarray of associative arrays that represent rows
 */
function newsFetchAll() {
	$query = "SELECT "
                . "`news`.*, `sections`.`title` AS section_title "
                . "FROM `news` "
                . "LEFT JOIN `sections` ON `news`.`section_id` = `sections`.`id`";
	
	
	return dbFetchAll($query);
}

/**
 * @param scalar $id
 * @return array Associative array that represent one row
 */
function newsFetchOneById($id) {
	
        $query = "SELECT "
                . "`news`.*, `sections`.`title` AS section_title "
                . "FROM `news` "
                . "LEFT JOIN `sections` ON `news`.`section_id` = `sections`.`id` "
                . "WHERE `news`.`id` = '" . dbEscape($id) . "' ";
    
	
	return dbFetchOne($query);
}

/**
 * @param int $id
 * @return int Affected rows
 */
function newsDeleteOneById($id) {
	
	$query = "DELETE FROM `news` "
			. "WHERE `id` = '" . dbEscape($id) . "'";
	
	return dbQuery($query);
}

/**
 * @param array $data Row to insert, associative array
 * @return type
 */
function newsInsertOne(array $data) {
	
	$columnsPart = "(`" . implode('`, `', array_keys($data)) . "`)";
	
	$values = array();
	
	foreach ($data as $value) {
		$values[] = "'" . dbEscape($value) . "'";
	}
	
	$valuesPart = "(" . implode(', ', $values) . ")";
	
	$query = "INSERT INTO `news` " . $columnsPart . " VALUES " . $valuesPart;

	
	dbQuery($query);
	
	return dbLastInsertId();
}

function newsUpdateOneById($id, $data) {
	
	$setParts = array();
	
	foreach ($data as $column => $value) {
		$setParts[] = "`" . $column . "` = '" . dbEscape($value) . "'";
	}
	
	$setPart = implode(',', $setParts);
	
	$query = "UPDATE `news` SET " . $setPart . " WHERE `id` = '" . dbEscape($id) . "'";

	return dbQuery($query);
}

/**
 * @return int Count of all rows in table
 */
function newsGetCount() {
	$link = dbGetLink();
	
	$query = "SELECT COUNT(`id`) FROM `news`";
	
	return dbFetchColumn($query);
}