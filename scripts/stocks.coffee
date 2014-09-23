# Description:
#   Greet the world
#
# Commands:
#   hubot greet - Say hello to the world

module.exports = (robot) ->
    robot.respond /stock (.*)/i, (msg) ->
        ticker = msg.match[1]
        msg.send "http://chart.finance.yahoo.com/z?s=#{ticker}&t=1d&q=l&l=on&z=l&a=v&p=s&lang=en-US&region=US#.png"