<?php
class ModelCatalogManufacturerart extends Model {
	public function getManufacturer($manufacturer_id) {

		$query = $this->db->query("SELECT ma.*, ca.name AS category_name, (SELECT GROUP_CONCAT(b.image SEPARATOR '*') FROM oc_banner_image b WHERE b.banner_id = ma.banner_id) AS images 
                FROM " . DB_PREFIX . "manufacturer_art ma LEFT JOIN " . DB_PREFIX . "category_art ca ON (ma.manufacturer_art_id = ca.category_art_id) WHERE ma.manufacturer_art_id = '" . (int)$manufacturer_id . "'");

		return $query->row;
	}

	public function getManufacturers($cat = 0) {
	    $q = "";
	    switch ($cat){
            case "ru":
                $q .= "AND ma.category_art_id = 1";
                break;
            case "world":
                $q .= "AND ma.category_art_id = 2";
                break;
            default:
                break;
        }
            $sql = "SELECT ma.*, ca.name AS category_name FROM " . DB_PREFIX . "manufacturer_art ma LEFT JOIN " . DB_PREFIX . "category_art ca ON (ma.category_art_id = ca.category_art_id) WHERE 1=1 ".$q." ORDER BY ma.`name` ASC";

        $query = $this->db->query($sql);

			return $query->rows;

	}
}