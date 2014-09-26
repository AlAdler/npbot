# Description:
#   SMS interface.
#
# Commands:
#   hubot set phone for <user> to <phone> - set the user's phone number.
#   hubot get phone for <user> - check the user's phone number
#   hubot send sms to <user> saying <msg> - sends the <msg> to the users phone

twilio = require('twilio');

module.exports = (robot) ->
    robot.respond /set phone for (.*) to (.*)$/i, (msg) ->
        user = msg.match[1]
        phone = msg.match[2]
        robot.brain.set "phone_user_#{user}", phone
        msg.send "OK, #{user}'s phone is #{phone}"
    
    robot.respond /get phone for (.*)$/i, (msg) ->
        user = msg.match[1]
        number = robot.brain.get "phone_user_#{user}"
        if number != null 
            msg.send "#{user}'s phone is #{number}"
        else
            msg.send "I don't know"
    
    robot.respond /send sms to (.*) saying (.*)$/i, (msg) ->
        user = msg.match[1]
        text = msg.match[2]
        number = robot.brain.get "phone_user_#{user}"
        if number != null 
            twilioClient = new twilio.RestClient process.env.TWILIO_ACC_SID, process.env.TWILIO_TOKEN
            twilioClient.sms.messages.create {to:number, from:process.env.TWILIO_FROM_PHONE, body:process.env.HUBOT_SLACK_BOTNAME + ': ' + text}, (error, message) ->
                if !error
                    msg.send "sent to phone #{number}"
                else
                    msg.send "there was an error sending the sms"    
        else
            msg.send "I don't know #{user}'s phone number"
    