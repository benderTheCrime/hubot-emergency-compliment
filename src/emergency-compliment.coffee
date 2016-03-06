# Description
#   Post an emergency compliment to a Slack user with http://emergencycompliment.com/!"
#
# Configuration:
#   NONE
#
# Commands:
#   hubot compliment <username> - Responds to the user with a compliment
#
# Notes:
#   If <username> is "me" the script will respond to the user who sent the message
#   Added an easter egg for our good friend Tom Blair
#
# Author:
#   Joe Groseclose <@benderTheCrime>

request = require 'request'

# NOTE: The URL, API, and Google Document used alongside this package belong
# expressly to the Author of http://emergencycompliment.com
url = 'https://spreadsheets.google.com/feeds/list/1eEa2ra2yHBXVZ_ctH4J15tFSGEu-VTSunsrvaCAV598/od6/public/values?alt=json'

module.exports = (robot) ->
  robot.respond /compliment (.*)/i, (res) ->
    username = res.match[ 2 ]
    username = res.message.user.name if username == 'me'
    compliment = "I like the cut of your jib, @#{username}"

    request.get url, (e, r, body) ->
      compliments = JSON.parse(body).feed.entry;

      if !e && r.statusCode == 200
        compliment = "@#{username}, #{
          compliments[ random compliments ].gsx$compliments.$t
        }"

        if /tj|tom\sblair/.test username
          compliment += ' :millennial: #appreciateTJday'

      res.send compliment

random = (arr) -> Math.floor (Math.random() * arr.length)