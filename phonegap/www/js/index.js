/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
	
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
	
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('init-ready');

		nfc.addTagDiscoveredListener(
			app.onTagRead,
			function(result) {
                app.receivedEvent('tag-listening');
            },
			function(reason) {
				app.receivedEvent('init-failed');
			}
		);
    },

    // Updates the status pane
    receivedEvent: function(eventId, temporary) {
        var container = $('#status');
        container.find('.event').css('display', 'none');
        container.find('.event.' + eventId).css('display', 'block');

        if (temporary === true) {
            window.setTimeout(function() { app.receivedEvent('tag-listening'); }, 4 * 1000);
        }
    },

    // what happens when a tag is read
    onTagRead: function(nfcEvent) {
        app.receivedEvent('tag-read', true);

        var tagId = nfcEvent.tag.id;
        var tagIdHex = nfc.bytesToHexString(tagId);

        app.sendId(tagIdHex)
	},

    // sending a request to the remote webservice
    sendId: function(tagIdHex) {
        $.ajax({
            type:           'GET',
            url:            'http://akopov.webfactional.com/patientrfid/index/tag',
            dataType:       'json',
            data:           'tag=' + tagIdHex,
            crossDomain:    true,

            beforeSend: function() {
                app.receivedEvent('tag-read');
            },

            success: function(response) {
                var html = '';

                if (response.error) {
                    app.receivedEvent('request-failed', true);
                    html = 'Tag ' + tagIdHex + ' read, but service returned an error: ' + error;
                } else {
                    if (response.tag === 'new') {
                        app.receivedEvent('tag-new', true);
                        html = 'Tag ' + tagIdHex + ' registered successfully. Please visit <a href="http://akopov.webfactional.com/patientrfid">http://akopov.webfactional.com/patientrfid</a> to set up a profile';

                    } else if (response.tag === 'found') {
                        if (response.twitter) {
                            app.receivedEvent('tag-found', true);
                            html = response.twitter.name + '<br/>' + response.twitter.location + '<br/>' + response.twitter.description + '<br/><img src="' + response.twitter.profile_image_url + '">';

                        } else {
                            app.receivedEvent('tag-wrong', true);
                            html = 'Tag ' + tagIdHex + ' mapped profile incorrect or not authorised';
                        }
                    }
                }

                $('#content').html(html);
            },

            error: function() {
                app.receivedEvent('request-failed', true);
            }
        });
    }
};
