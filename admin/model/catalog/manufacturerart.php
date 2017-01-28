<?php
class ModelCatalogManufacturerart extends Model {
	public function addManufacturerart($data) {
		$this->event->trigger('pre.admin.manufacturer.add', $data);
		$this->db->query("INSERT INTO " . DB_PREFIX . "manufacturer_art SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', banner_id = '" . (int)$data['banner'] . "',category_art_id = '" . (int)$data['category_art'] . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$manufacturer_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "manufacturer_art SET image = '" . $this->db->escape($data['image']) . "' WHERE manufacturer_art_id = '" . (int)$manufacturer_id . "'");
		}

//		if (isset($data['manufacturer_store'])) {
//			foreach ($data['manufacturer_store'] as $store_id) {
//				$this->db->query("INSERT INTO " . DB_PREFIX . "manufacturer_to_store SET manufacturer_id = '" . (int)$manufacturer_id . "', store_id = '" . (int)$store_id . "'");
//			}
//		}

//		if (isset($data['keyword'])) {
//			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'manufacturer_id=" . (int)$manufacturer_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
//		}

		$this->cache->delete('manufacturer');

		$this->event->trigger('post.admin.manufacturer.add', $manufacturer_id);

		return $manufacturer_id;
	}

	public function editManufacturerart($manufacturer_id, $data) {
		$this->event->trigger('pre.admin.manufacturer.edit', $data);
		$this->db->query("UPDATE " . DB_PREFIX . "manufacturer_art SET name = '" . $this->db->escape($data['name']) . "',description = '" . $this->db->escape($data['description']) . "', banner_id = '" . (int)$data['banner'] . "', category_art_id = '" . (int)$data['category_art'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE manufacturer_art_id = '" . (int)$manufacturer_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "manufacturer_art SET image = '" . $this->db->escape($data['image']) . "' WHERE manufacturer_art_id = '" . (int)$manufacturer_id . "'");
		}

//		$this->db->query("DELETE FROM " . DB_PREFIX . "manufacturer_to_store WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");
//
//		if (isset($data['manufacturer_store'])) {
//			foreach ($data['manufacturer_store'] as $store_id) {
//				$this->db->query("INSERT INTO " . DB_PREFIX . "manufacturer_to_store SET manufacturer_id = '" . (int)$manufacturer_id . "', store_id = '" . (int)$store_id . "'");
//			}
//		}

//		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'manufacturer_id=" . (int)$manufacturer_id . "'");
//
//		if ($data['keyword']) {
//			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'manufacturer_id=" . (int)$manufacturer_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
//		}

		$this->cache->delete('manufacturer');

		$this->event->trigger('post.admin.manufacturer.edit', $manufacturer_id);
	}

	public function deleteManufacturer($manufacturer_id) {
		$this->event->trigger('pre.admin.manufacturer.delete', $manufacturer_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "manufacturer_art WHERE manufacturer_art_id = '" . (int)$manufacturer_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "manufacturer_to_store WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'manufacturer_id=" . (int)$manufacturer_id . "'");

		$this->cache->delete('manufacturer');

		$this->event->trigger('post.admin.manufacturer.delete', $manufacturer_id);
	}

	public function getManufacturerart($manufacturer_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'manufacturer_id=" . (int)$manufacturer_id . "') AS keyword FROM " . DB_PREFIX . "manufacturer_art WHERE manufacturer_art_id = '" . (int)$manufacturer_id . "'");

		return $query->row;
	}

    public function getCategory($data = array()){
        $sql_b = "SELECT * FROM " . DB_PREFIX . "category_art";

        $query = $this->db->query($sql_b);

        return $query->rows;
    }
    public function getBanners($data = array()){
        $sql_b = "SELECT * FROM " . DB_PREFIX . "banner";

        $query = $this->db->query($sql_b);

        return $query->rows;
    }
	public function getManufacturersArts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "manufacturer_art";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getManufacturerStores($manufacturer_id) {
		$manufacturer_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "manufacturer_to_store WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");

		foreach ($query->rows as $result) {
			$manufacturer_store_data[] = $result['store_id'];
		}

		return $manufacturer_store_data;
	}

	public function getTotalManufacturersArts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "manufacturer");

		return $query->row['total'];
	}
}
