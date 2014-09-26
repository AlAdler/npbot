// Description:
//   notify all the things!
//
// URLS:
//   POST /hubot/notify ({message:<message>, channel:<channel>, phones:[<phone1, phone2]})

module.exports = function(robot){
    robot.router.post('/hubot/notify', function(req, res){
        var body = req.body;
        robot.messageRoom(body.channel, body.message);
        res.end();
    });
}