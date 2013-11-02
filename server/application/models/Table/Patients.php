<?php
class Table_Patients extends Table {
    protected $_name = 'patients';
    protected $_rowClass = 'Entity_Patient';

    /**
     * @param   string  $tag
     * @return  Entity_Patient
     * @throws  Exception
     */
    public function getByTag($tag) {
        $select = $this->select();
        $select->where('tag = ?', $tag);

        $patient = $this->fetchRow($select);
        if (!($patient instanceof Entity_Patient)) {
            throw new Exception('Requested tag ' . $tag . ' has no match');
        }

        return $patient;
    }

    /**
     * @return  Entity_Patient[]
     */
    public function getAllPatients() {
        return $this->fetchAll();
    }

}