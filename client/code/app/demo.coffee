### QUICK CHAT DEMO ####

# Delete this file once you've seen how the demo works

exports.init = ->
  
  $('#demo').hide()

  
  # Listen out for newMessage events coming from the server
  ss.event.on 'newMessage', (params) ->
    username = params.user
    message = params.body
    console.log(username)
    # Example of using the Hogan Template in client/templates/chat/message.jade to generate HTML for each message
    html = HT['chat-message'].render({username: username, message: message, time: -> timestamp() })

    # Append it to the #chatlog div and show effect
    $(html).hide().appendTo('#chatlog').slideDown()

  #Listen out for newServerTime events coming from the server
  ss.event.on 'newServerTime', (serverTime) ->
  
    html = HT['chat-time'].render({time: serverTime})

    # $('#serverTime').replaceWith(html)

    document.getElementById('serverTime').innerHTML = serverTime  
    
  # Show the chat form and bind to the submit action
    
  $('form#demo').submit ->
    text = $('#myMessage').val()

    # Call the 'send' funtion (below) to ensure it's valid before sending to the server  
    exports.send text, (success) ->
      if success
        $('#myMessage').val('') # clear text box
      else
        alert('Oops! Unable to send message')
        
  exports.checkSession()

  # Demonstrates sharing code between modules by exporting function
  
exports.send = (text, cb) ->
  if valid(text)
    ss.rpc('demo.sendMessage', text, cb)
  else
    cb(false)

exports.checkSession = (user) ->
  ss.rpc('demo.checkSession', user)
  if user then $('#demo').show() else displaySignInForm()

# Private functions

displaySignInForm = (response) ->
  $('#signIn').show().submit ->
    loginName = $('#login').val()
    ss.rpc('demo.signIn', loginName, response)
    $('#signInError').remove()
    displayMainScreen()

displayMainScreen = ->
  $('#signIn').fadeOut(230) and $('#demo').show()

timestamp = ->
  d = new Date()
  d.getHours() + ':' + pad2(d.getMinutes()) + ':' + pad2(d.getSeconds())

pad2 = (number) ->
  (if number < 10 then '0' else '') + number

valid = (text) ->
  text && text.length > 0
  
exports.init()