// Description:
//   notify all the things! with optional SMS
//
// URLS:
//   POST /hubot/npnotify ({"message":"<message>", "channel":"<channel>", "phones":["<phone1>", "<phone2>"]})

var twilio = require('twilio');

module.exports = function(robot){
    robot.router.post('/hubot/npnotify', function(req, res){
        robot.messageRoom(req.body.channel, req.body.message);
        if(req.body.phones !== null && req.body.phones !== undefined && req.body.phones.length > 0){
            var twilioClient = new twilio.RestClient(process.env.TWILIO_ACC_SID, process.env.TWILIO_TOKEN);
            var phones = req.body.phones;
            for (var i = phones.length; i--; ) {
                twilioClient.sms.messages.create({
                    to:phones[i],
                    from:process.env.TWILIO_FROM_PHONE,
                    body:process.env.HUBOT_SLACK_BOTNAME + ': ' + req.body.message
                }, null);//TODO: add logs on fail
            }
        }
        res.end();
    });
}