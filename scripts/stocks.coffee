# Description:
#   Show chart for a stock
#
# Commands:
#   hubot stock <ticker> - Shows a chart for <ticker>

module.exports = (robot) ->
    robot.respond /stock (.*)/i, (msg) ->
        ticker = msg.match[1]
        msg.send "http://chart.finance.yahoo.com/z?s=#{ticker}&t=1d&q=l&l=on&z=l&a=v&p=s&lang=en-US&region=US#.png"
        msg.send "http://finance.yahoo.com/q;_ylt=AugVdNDKc1TMT2PGO_2wX9onv7gF?uhb=uhb2&fr=uh3_finance_vert_gs&type=2button&s=ERBB"