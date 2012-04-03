# Server-side Code

# Define actions which can be called from the client using ss.rpc('demo.ACTIONNAME', param1, param2...)
exports.actions = (req, res, ss) ->

  # Example of pre-loading sessions into req.session using internal middleware
  req.use('session')

  # Uncomment line below to use the middleware defined in server/middleware/example

  # req.use('example.authenticated')
    
  checkSession: (user) ->
    if req.session.userId
      return req.session.userId
    else
      return false
        
  sendMessage: (message, cb) ->
    if message && message.length > 0            # Check for blank messages
      ss.publish.all('newMessage', {user: req.session.userId, body: message})     # Broadcast the message to everyone
      res(true)                                 # Confirm it was sent to the originating client
    else
      res(false)
      
  signIn: (user, cb) ->
    req.session.setUserId(user)
    return req.session.userId