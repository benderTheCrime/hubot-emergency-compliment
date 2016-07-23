Helper = require 'hubot-test-helper'
request = require 'request'

sinon = require 'sinon'
chai = require 'chai'
assert = chai.assert
expect = chai.expect

helper = new Helper '../../src/emergency-compliment.coffee'

describe 'compliment', ->
  room = null
  getSpy = null

  beforeEach ->
    room = helper.createRoom()
    getSpy = sinon.stub request, 'get', (_, fn) ->
      fn null, { statusCode: 200 }, "{\"feed\":{\"entry\":[{\"gsx$compliments\":{\"$t\":\"bar\"}}]}}"
  afterEach ->
    room.destroy()
    getSpy.restore()
  describe 'user is "me"', ->
    beforeEach -> room.user.say 'alice', 'hubot compliment me'
    it 'should reply with a compliment', ->
      assert getSpy.called
      expect(room.messages[ 1 ][ 0 ]).to.eql 'hubot'
      expect(room.messages[ 1 ][ 1 ]).to.contain '@alice, bar'
  describe 'user is "@bob"', ->
    beforeEach -> room.user.say 'alice', 'hubot compliment @bob'
    it 'should reply with a compliment', ->
      assert getSpy.called
      expect(room.messages[ 1 ][ 0 ]).to.eql 'hubot'
      expect(room.messages[ 1 ][ 1 ]).to.contain '@bob, bar'