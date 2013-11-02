<?php
class IndexController extends Zend_Controller_Action {
    /**
     * Displays tag / Twitter mapping form
     */
    public function indexAction() {
        $patientsTable = new Table_Patients();
        $patients = $patientsTable->getAllPatients();

        $this->view->patients = $patients;
    }

    /**
     * Webservice called by the mobile app with the RFID tag as the only parameter
     *
     * Three possible use cases are:
     *
     * 1) Tag doesn't exist in DB, in which case it is added
     * 2) Tag exists in DB, but isn't mapped to a Twitter account yet
     * 3) Tag exists in DB and is mapped to a Twitter account
     *
     */
    public function tagAction() {
        $tag = $this->_getParam('tag');
        if (strlen($tag) === 0) {
            $this->_helper->json(array(
                'error' => 'No tag supplied'
            ));
            return;
        }

        $patientsTable = new Table_Patients();
        $data = array();

        try {
            // attempting to retrieve patient record for the supplied tag
            $patient = $patientsTable->getByTag($tag);
            $data['tag'] = 'found';

            try {
                // attempting to retrieve user's Twitter details
                $data['twitter'] = $patient->getTwitterProfile();

            } catch (Exception $e) {
                // letting application know twitter account is not mapped or is wrong
                $data['twitter'] = null;
            }

        } catch (Exception $e) {
            // new tag - adding and letting application know the tag as added
            $patientsTable->insert(array('tag' => $tag));
            $data['tag'] = 'new';
        }

        return $this->_helper->json($data);
    }

    /**
     * Removes tag from the database
     */
    public function forgetAction() {
        $tag = $this->_getParam('tag');
        if (strlen($tag)) {
            $patientsTable = new Table_Patients();
            $patientsTable->delete($patientsTable->getAdapter()->quoteInto('tag = ?', $tag));
        }

        $this->redirect(APPLICATION_URL . '/index/index');
    }

    /**
     * Updates twitter names in the database
     */
    public function updateAction() {
        $twitterNames = $this->_getParam('twitter');

        if (is_array($twitterNames) and count($twitterNames)) {
            $patientsTable = new Table_Patients();

            foreach ($twitterNames as $tag => $twitter) {
                $patientsTable->update(
                    array('twitter_name' => $twitter),
                    $patientsTable->getAdapter()->quoteInto('tag = ?', $tag)
                );
            }
        }


        $this->redirect(APPLICATION_URL . '/index/index');
    }
}
