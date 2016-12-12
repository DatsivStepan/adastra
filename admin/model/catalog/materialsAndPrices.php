<?php
class ModelCatalogmaterialsAndPrices extends Model {
    public function addmaterialsAndPrices($data) {
        $this->event->trigger('pre.admin.materialsAndPrices.add', $data);

        $this->db->query("INSERT INTO " . DB_PREFIX . "mp_information SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "', fabric_thickness = '" . $data['fabric_thickness'] . "', prices = '" . $data['prices'] . "', MPWJ = '" . $data['MPWJ'] . "', category = '" . $data['category'] ."'");

        $mp_id = $this->db->getLastId();

        foreach ($data['information_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "mp_information_description SET mp_id = '" . (int)$mp_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
        }

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "mp_information SET image = '" . $this->db->escape($data['image']) . "' WHERE mp_id = '" . (int)$mp_id . "'");
        }

        if (isset($data['information_store'])) {
            foreach ($data['information_store'] as $store_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "mp_information_to_store SET mp_id = '" . (int)$mp_id . "', store_id = '" . (int)$store_id . "'");
            }
        }

        if (isset($data['information_layout'])) {
            foreach ($data['information_layout'] as $store_id => $layout_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "mp_information_to_layout SET mp_id = '" . (int)$mp_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
            }
        }

        if (isset($data['keyword'])) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'mp_id=" . (int)$mp_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('information');

        $this->event->trigger('post.admin.information.add', $mp_id);

        return $mp_id;
    }
    public function editInformationCategory($mp_c_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "mp_category SET name = '" . $data['category_info'] .
            "', description = '" .  $this->db->escape($data['information_description'][1]['description']) .
            "' WHERE mp_c_id = '" . (int)$mp_c_id . "'");
    }
    public function addInformationCategory($data) {

        $this->db->query("INSERT INTO " . DB_PREFIX . "mp_category SET name = '" . $data['category_info'] . "', description = '" . $data['information_description'][1]['description'] . "'");
    }

    public function editInformation($mp_id, $data) {
        $this->event->trigger('pre.admin.information.edit', $data);

        $this->db->query("UPDATE " . DB_PREFIX . "mp_information SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "', fabric_thickness = '" . $data['fabric_thickness'] . "', prices = '" . $data['prices'] . "', MPWJ = '" . $data['MPWJ'] . "', category = '" . $data['category'] . "' WHERE mp_id = '" . (int)$mp_id . "'");

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "mp_information SET image = '" . $this->db->escape($data['image']) . "' WHERE mp_id = '" . (int)$mp_id . "'");
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "mp_information_description WHERE mp_id = '" . (int)$mp_id . "'");

        foreach ($data['information_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "mp_information_description SET mp_id = '" . (int)$mp_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "mp_information_to_store WHERE mp_id = '" . (int)$mp_id . "'");

        if (isset($data['information_store'])) {
            foreach ($data['information_store'] as $store_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "mp_information_to_store SET mp_id = '" . (int)$mp_id . "', store_id = '" . (int)$store_id . "'");
            }
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "mp_information_to_layout WHERE mp_id = '" . (int)$mp_id . "'");

        if (isset($data['information_layout'])) {
            foreach ($data['information_layout'] as $store_id => $layout_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "mp_information_to_layout SET mp_id = '" . (int)$mp_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
            }
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'mp_id=" . (int)$mp_id . "'");

        if ($data['keyword']) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'mp_id=" . (int)$mp_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
        }

        $this->cache->delete('information');

        $this->event->trigger('post.admin.information.edit', $mp_id);
    }
    public function deleteInformationCategory($mp_c_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "mp_category WHERE mp_c_id = '" . (int)$mp_c_id . "'");
    }
    public function deleteInformation($mp_id) {
        $this->event->trigger('pre.admin.information.delete', $mp_id);
        $this->db->query("DELETE FROM " . DB_PREFIX . "mp_information WHERE mp_id = '" . (int)$mp_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "mp_information_description WHERE mp_id = '" . (int)$mp_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "mp_information_to_store WHERE mp_id = '" . (int)$mp_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "mp_information_to_layout WHERE mp_id = '" . (int)$mp_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'mp_id=" . (int)$mp_id . "'");

        $this->cache->delete('information');

        $this->event->trigger('post.admin.information.delete', $mp_id);
    }

    public function getInformation($mp_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'mp_id=" . (int)$mp_id . "') AS keyword FROM " . DB_PREFIX . "mp_information WHERE mp_id = '" . (int)$mp_id . "'");

        return $query->row;
    }

    /////////////////////////////////////
    public function getInformationsCategory() {


        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_category ");

        return $query->rows;
    }

    /////////////////////////////////////

    public function getInformations($data = array()) {
        if ($data) {

            $sql = "SELECT * FROM " . DB_PREFIX . "mp_information i LEFT JOIN " . DB_PREFIX . "mp_information_description id ON (i.mp_id = id.mp_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

            $sort_data = array(
                'id.title',
                'i.sort_order'
            );

            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                $sql .= " ORDER BY " . $data['sort'];
            } else {
                $sql .= " ORDER BY id.title";
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
        } else {
            $information_data = $this->cache->get('information.' . (int)$this->config->get('config_language_id'));

            if (!$information_data) {
                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_information i LEFT JOIN " . DB_PREFIX . "mp_information_description id ON (i.mp_id = id.mp_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

                $information_data = $query->rows;

                $this->cache->set('information.' . (int)$this->config->get('config_language_id'), $information_data);
            }

            return $information_data;
        }

    }
    //////////////////////////////////////////////////////////////////////////////
    public function getMpCategory($mp_c_id) {
        $information_description_data = array();
        $query_c = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_category WHERE mp_c_id = '" . (int)$mp_c_id . "'");
        foreach ($query_c->rows as $result_c ){
            $information_description_data[$result_c['mp_c_id']] = array(
                'name'             => $result_c['name'],
                'description'      => $result_c['description'],
            );
        }
        return $information_description_data;
    }
    //////////////////////////////////////////////////////////////////////////////


    public function getInformationDescriptions($mp_id) {
        $information_description_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_information_description WHERE mp_id = '" . (int)$mp_id . "'");
        foreach ($query->rows as $result) {
            $information_description_data[$result['language_id']] = array(
                'title'            => $result['title'],
                'description'      => $result['description'],
                'meta_title'       => $result['meta_title'],
                'meta_description' => $result['meta_description'],
                'meta_keyword'     => $result['meta_keyword']
            );
        }

        return $information_description_data;
    }

    public function getInformationStores($mp_id) {
        $information_store_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_information_to_store WHERE mp_id = '" . (int)$mp_id . "'");

        foreach ($query->rows as $result) {
            $information_store_data[] = $result['store_id'];
        }

        return $information_store_data;
    }

    public function getInformationLayouts($mp_id) {
        $information_layout_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "mp_information_to_layout WHERE mp_id = '" . (int)$mp_id . "'");

        foreach ($query->rows as $result) {
            $information_layout_data[$result['store_id']] = $result['layout_id'];
        }

        return $information_layout_data;
    }

    public function getTotalInformations() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "mp_information");

        return $query->row['total'];
    }

    public function getTotalInformationsByLayoutId($layout_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "mp_information_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

        return $query->row['total'];
    }
}