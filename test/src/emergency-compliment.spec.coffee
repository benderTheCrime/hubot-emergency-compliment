Helper = require 'hubot-test-helper'
request = require 'request'

sinon = require 'sinon'
chai = require 'chai'
assert = chai.assert
expect = chai.expect

helper = new Helper '../../src/emergency-compliment.coffee'

describe 'ping', ->
  room = undefined

  beforeEach -> room = helper.createRoom()
  afterEach -> room.destroy()
  context 'user tries to create a meme', ->
    getSpy = undefined

    beforeEach ->
      getSpy = sinon.spy request, 'get'
      room.user.say 'alice', 'hubot compliment me'
    afterEach -> sinon.restore()
    it 'should reply pong to user', (cb) ->
      assert getSpy.called

      expect(room.messages[ 0 ]).to.eql [ 'alice', 'hubot compliment me' ]