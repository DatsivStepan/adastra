<?php
class ModelCatalogmaterialsAndPrices extends Model {
	public function getInformation($information_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "mp_information i LEFT JOIN " . DB_PREFIX . "mp_information_description id ON (i.mp_id = id.mp_id) LEFT JOIN " . DB_PREFIX . "mp_information_to_store i2s ON (i.mp_id = i2s.mp_id) WHERE i.mp_id = '" . (int)$information_id . "' AND id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'");

		return $query->row;
	}

	public function getInformations($category_id=null) {
        if($category_id != null){
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_information i
		    LEFT JOIN " . DB_PREFIX . "mp_information_description id ON (i.mp_id = id.mp_id)
		    LEFT JOIN " . DB_PREFIX . "mp_information_to_store i2s ON (i.mp_id = i2s.mp_id) 
		    WHERE i.category = '".$category_id."' 
		        AND id.language_id = '" . (int)$this->config->get('config_language_id') . "'
		        AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
		        AND i.status = '1' ORDER BY i.category ASC");
        }else{
		    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_information i LEFT JOIN " . DB_PREFIX . "mp_information_description id ON (i.mp_id = id.mp_id) LEFT JOIN " . DB_PREFIX . "mp_information_to_store i2s ON (i.mp_id = i2s.mp_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' ORDER BY i.category ASC");
        }

		return $query->rows;
	}

    public function getInformationsCategory() {
        $query_c = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_category ");

        return $query_c->rows;
    }

	public function getInformationLayoutId($information_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information_to_layout WHERE information_id = '" . (int)$information_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}
}