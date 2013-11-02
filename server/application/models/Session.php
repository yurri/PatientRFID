<?php
class Session {
    public static function getSession() {
        $session = new Zend_Session_Namespace('default');

        return $session;
    }

    /**
     * @return Entity_Student
     */
    public static function getCurrentStudent() {
        $studentId = self::getSession()->studentId;
        if (strlen($studentId) === 0) {
            $studentId = 1;
        }

        $students = new Students();
        $student = $students->getById($studentId);
        return $student;
    }
}
