### QUICK CHAT DEMO ####

# Delete this file once you've seen how the demo works

# Listen out for newMessage events coming from the server
ss.event.on 'newMessage', (message) ->

  # Example of using the Hogan Template in client/templates/chat/message.jade to generate HTML for each message
  html = HT['chat-message'].render({message: message, time: -> timestamp() })

  # Append it to the #chatlog div and show effect
  $(html).hide().appendTo('#chatlog').slideDown()

#Listen out for newServerTime events coming from the server
ss.event.on 'newServerTime', (serverTime) ->
  
  html = HT['chat-time'].render({time: serverTime})

  # $('#serverTime').replaceWith(html)

  document.getElementById('serverTime').innerHTML = serverTime
  
# $('#demo').hide()
    
# Show the chat form and bind to the submit action
    
$('#demo').on 'submit', ->

  # Grab the message from the text box
  text = $('#myMessage').val()

  # Call the 'send' funtion (below) to ensure it's valid before sending to the server
  
  exports.send text, (success) ->
    if success
      $('#myMessage').val('') # clear text box
    else
      alert('Oops! Unable to send message')

# Demonstrates sharing code between modules by exporting function
  
exports.send = (text, cb) ->
  if valid(text)
    ss.rpc('demo.sendMessage', text, cb)
  else
    cb(false)

# Private functions

# checkUser = (user) ->
#  ss.rpc('demo.checkUser', user)
#  if user
#    $('#demo').show
#  else
 #   displaySignInForm()

displaySignInForm = ->
  $('#signIn').on 'submit', -> 
    login = $('#myLogin').val()
    console.log(login)
 #   ss.rpc('demo.signIn', login, cb) ->
 #     $('#signInError').remove()
 #     displayMainScreen()
    false

displayMainScreen = ->
  $('#signIn').fadeOut(230) and $('#demo').show()

timestamp = ->
  d = new Date()
  d.getHours() + ':' + pad2(d.getMinutes()) + ':' + pad2(d.getSeconds())

pad2 = (number) ->
  (if number < 10 then '0' else '') + number

valid = (text) ->
  text && text.length > 0