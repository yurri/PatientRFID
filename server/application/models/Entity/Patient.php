<?php
require_once('TwitterAPIExchange.php'); // http://stackoverflow.com/questions/14836956/how-to-get-user-image-with-twitter-api-1-1


class Entity_Patient extends Zend_Db_Table_Row_Abstract {
    /**
     * @return  stdClass
     * @throws  Exception
     */
    public function getTwitterProfile() {
        if (strlen($this->twitter_name) === 0) {
            throw new Exception('Twitter name not specified');
        }

        $getField = '?screen_name=' . urlencode($this->twitter_name);

        $config = Config::getConfig();
        $twitter = new TwitterAPIExchange(array(
            'oauth_access_token'        => $config->twitter->oauth_access_token,
            'oauth_access_token_secret' => $config->twitter->oauth_access_token_secret,
            'consumer_key'              => $config->twitter->consumer_key,
            'consumer_secret'           => $config->twitter->consumer_secret
        ));

        $strJson = $twitter
            ->setGetfield($getField)
            ->buildOauth('https://api.twitter.com/1.1/users/show.json', 'GET')
            ->performRequest()
        ;

        $json = json_decode($strJson);

        return $json;
    }
}