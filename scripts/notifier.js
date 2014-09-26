// Description:
//   notify all the things!
//
// URLS:
//   POST /hubot/notify ({message:<message>, channel:<channel>, phones:[<phone1, phone2]})

module.exports = function(robot){
    robot.router.post('/hubot/npnotify', function(req, res){
        robot.messageRoom(req.body.channel, req.body.message);
        res.end();
    });
}