# hubot-emergency-compliment

Post an emergency compliment to a Slack user with http://emergencycompliment.com/!"
See [`src/emergency-compliment.coffee`](src/emergency-compliment.coffee) for full documentation.

**NOTE: The URL, API, and Google Document used alongside this package belong
expressly to the Author of [emergencycompliment.com](http://emergencycompliment.com)**

## Installation

In hubot project repo, run:

`npm install hubot-emergency-compliment --save`

Then add **hubot-emergency-compliment** to your `external-scripts.json`:

```json
[
  "hubot-emergency-compliment"
]
```

## Sample Interaction

```
user1>> compliment me
hubot>> @user1, You're beautiful!
user2>> compliment user1
hubot>> @user1, You're beautiful!
```