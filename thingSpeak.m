%Details on the channel
channelID = 1183104;

% Provide the ThingSpeak alerts API key.  All alerts API keys start with TAK.
alertApiKey = 'TAKEBEKZUWFMMD5TU7YDG';

% Set the address for the HTTTP call
alertUrl="https://api.thingspeak.com/alerts/send";

% webwrite uses weboptions to add required headers.  Alerts needs a ThingSpeak-Alerts-API-Key header.
options = weboptions("HeaderFields", ["ThingSpeak-Alerts-API-Key", alertApiKey ]);

% Set the email subject.
alertSubject = sprintf("Incendie détecté");
alertBody='Un incendie a été détecté, vous pouvez suivre la température de la pièce sur https://thingspeak.com/channels/1183104'
try
        webwrite(alertUrl , "body", alertBody, "subject", alertSubject, options);
catch someException
        fprintf("Failed to send alert: %s\n", someException.message);
end
