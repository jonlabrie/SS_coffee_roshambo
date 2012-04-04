flipDisplay = (d, options) ->
  
  defaults =
    currentMessage: ""
    effect: "rotate"
    padChar: " "
    displayWidth: 15
    numChars: 99
    pace: 1000
    hold: 10000
    auto: true
    tFH: 12
    bFH: 12
    fW: 19
    cW: 133

  chars =
    "0":
      column: 0
      row: 0

    "1":
      column: 0
      row: 1

    "2":
      column: 0
      row: 2

    "3":
      column: 0
      row: 3

    "4":
      column: 0
      row: 4

    "5":
      column: 0
      row: 5

    "6":
      column: 0
      row: 6

    "7":
      column: 0
      row: 7

    "8":
      column: 0
      row: 8

    "9":
      column: 0
      row: 9

    ".":
      column: 0
      row: 10

    ",":
      column: 0
      row: 11

    "/":
      column: 0
      row: 12

    "\\":
      column: 0
      row: 13

    "|":
      column: 0
      row: 14

    ">":
      column: 0
      row: 15

    "<":
      column: 0
      row: 16

    "?":
      column: 0
      row: 17

    "+":
      column: 0
      row: 18

    "-":
      column: 0
      row: 19

    "=":
      column: 0
      row: 20

    "_":
      column: 0
      row: 21

    ")":
      column: 0
      row: 22

    "(":
      column: 0
      row: 23

    "*":
      column: 0
      row: 24

    "^":
      column: 0
      row: 25

    "&":
      column: 0
      row: 26

    "$":
      column: 0
      row: 27

    "#":
      column: 0
      row: 28

    "!":
      column: 0
      row: 29

    "\"":
      column: 0
      row: 30

    "”":
      column: 0
      row: 31

    "˚":
      column: 0
      row: 32

    "A":
      column: 1
      row: 0

    "B":
      column: 1
      row: 1

    "C":
      column: 1
      row: 2

    "D":
      column: 1
      row: 3

    "E":
      column: 1
      row: 4

    "F":
      column: 1
      row: 5

    "G":
      column: 1
      row: 6

    "H":
      column: 1
      row: 7

    "I":
      column: 1
      row: 8

    "J":
      column: 1
      row: 9

    "K":
      column: 1
      row: 10

    "L":
      column: 1
      row: 11

    "M":
      column: 1
      row: 12

    "N":
      column: 1
      row: 13

    "O":
      column: 1
      row: 14

    "P":
      column: 1
      row: 15

    "Q":
      column: 1
      row: 16

    "R":
      column: 1
      row: 17

    "S":
      column: 1
      row: 18

    "T":
      column: 1
      row: 19

    "U":
      column: 1
      row: 20

    "V":
      column: 1
      row: 21

    "W":
      column: 1
      row: 22

    "X":
      column: 1
      row: 23

    "Y":
      column: 1
      row: 24

    "Z":
      column: 1
      row: 25

    ";":
      column: 1
      row: 26

    "`":
      column: 1
      row: 27

    "~":
      column: 1
      row: 28

    ":":
      column: 1
      row: 29

    "'":
      column: 1
      row: 30

    "’":
      column: 1
      row: 31

    "¯":
      column: 1
      row: 32

    "a":
      column: 2
      row: 0

    "b":
      column: 2
      row: 1

    "c":
      column: 2
      row: 2

    "d":
      column: 2
      row: 3

    "e":
      column: 2
      row: 4

    "f":
      column: 2
      row: 5

    "g":
      column: 2
      row: 6

    "h":
      column: 2
      row: 7

    "i":
      column: 2
      row: 8

    "j":
      column: 2
      row: 9

    "k":
      column: 2
      row: 10

    "l":
      column: 2
      row: 11

    "m":
      column: 2
      row: 12

    "n":
      column: 2
      row: 13

    "o":
      column: 2
      row: 14

    "p":
      column: 2
      row: 15

    "q":
      column: 2
      row: 16

    "r":
      column: 2
      row: 17

    "s":
      column: 2
      row: 18

    "t":
      column: 2
      row: 19

    "u":
      column: 2
      row: 20

    "v":
      column: 2
      row: 21

    "w":
      column: 2
      row: 22

    "x":
      column: 2
      row: 23

    "y":
      column: 2
      row: 24

    "z":
      column: 2
      row: 25

    "å":
      column: 2
      row: 26

    "ô":
      column: 2
      row: 27

    "ō":
      column: 2
      row: 28

    "@":
      column: 2
      row: 29

    "%":
      column: 2
      row: 30

    " ":
      column: 2
      row: 31

    "\\o":
      column: 2
      row: 32

  sequence = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", ",", "/", "\\", "|", ">", "<", "?", "+", "-", "=", "_", ")", "(", "*", "^", "&", "$", "#", "!", "\"", "”", "˚", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", ";", "`", "~", ":", "'", "’", "¯", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "å", "ô", "ō", "@", "%", " ", "\\o" ]
  o = options or {}
  doc = window.document
  divId = (if typeof d isnt "undefined" and d isnt "" then d else "flip-display")
  div = doc.getElementById(divId)
  for opt of defaults
    o[opt] = (if (opt of o) then o[opt] else defaults[opt])
  messageOld = []
  messageNew = []
  messagesUrgent = []
  messagesRegular = []
  nextChange = null
  newCharacter = undefined
  sequenceOld = undefined
  sequenceNew = undefined
  countdown = undefined
  nextLine = 0
  nextChar = 0
  
  #
  getSequenceId = (c) ->
    id = ((chars[c].column) * 33) + (chars[c].row)
    id
  messageDisplay = ->
    newLine = ""
    if messagesUrgent.length > 0
      newLine = messagesUrgent.shift()
      messageDirect newLine
    else if messagesRegular.length > 0
      newLine = messagesRegular.shift()
      messageTumble newLine
    else
      clearNext()
      nextChange = setTimeout(messageDisplay, o.hold)
  arraysEqual = (arr1, arr2) ->
    return false  if arr1.length isnt arr2.length
    i = arr1.length

    while i--
      return false  if arr1[i] isnt arr2[i]
    true
  addPad = (message) ->
    messagePadded = message
    i = message.length

    while i < o.displayWidth
      messagePadded = messagePadded + o.padChar
      i++
    messagePadded
  messageDirect = (x) ->
    messageOld = o.currentMessage.split("").reverse()
    messageNew = x.split("").reverse()
    unless arraysEqual(messageOld, messageNew)
      i = 0

      while i < o.displayWidth
        if messageOld[i] isnt messageNew[i]
          animateChar i, messageOld[i], messageNew[i]
          messageOld.splice i, 1, sequence[nextChar]
        i++
      clearNext()
      nextChange = setTimeout(messageDisplay, o.hold)
    o.currentMessage = x
  messageTumble = (x) ->
    animateMessage = ->
      unless arraysEqual(messageOld, messageNew)
        i = 0

        while i < o.displayWidth
          if messageOld[i] isnt messageNew[i]
            sequenceOld = sequence.indexOf(messageOld[i])
            if sequenceOld is (o.numChars - 1)
              nextChar = 0
            else
              nextChar = sequenceOld + 1
            animateChar i, messageOld[i], sequence[nextChar]
            messageOld.splice i, 1, sequence[nextChar]
          i++
        setTimeout animateMessage, o.pace
      clearNext()
      nextChange = setTimeout(messageDisplay, o.hold)
    messageOld = o.currentMessage.split("").reverse()
    messageNew = x.split("").reverse()
    o.currentMessage = x
    animateMessage()
  animateChar = (n, oldChar, newChar) ->
    animate = ->
      if step < 7
        w = (if step < 3 then "t" else "b")
        a = doc.getElementById(divId + "_" + w + "_d" + n)
        a.style.backgroundPosition = bp[step]  if a
        step++
        unless step is 3
          setTimeout animate, speed
        else
          animate()
    speed = o.pace / 3
    step = 0
    w = undefined
    a = undefined
    bp = [ "-" + ((chars[oldChar].column * o.cW) + o.fW) + "px -" + (chars[oldChar].row * o.tFH) + "px", "-" + (chars[oldChar].column * o.cW) + (o.fW * 2) + "px -" + (chars[oldChar].row * o.tFH) + "px", "-" + (chars[newChar].column * o.cW) + "px -" + (chars[newChar].row * o.tFH) + "px", "-" + (chars[oldChar].column * o.cW) + (o.fW * 6) + "px -" + (chars[oldChar].row * o.bFH) + "px", "-" + (chars[newChar].column * o.cW) + (o.fW * 5) + "px -" + (chars[newChar].row * o.bFH) + "px", "-" + (chars[newChar].column * o.cW) + (o.fW * 4) + "px -" + (chars[newChar].row * o.bFH) + "px", "-" + (chars[newChar].column * o.cW) + (o.fW * 3) + "px -" + (chars[newChar].row * o.bFH) + "px" ]
    animate()
    
    # Set up the display
    
  displaySet = ->
    count = o.displayWidth
    i = undefined
    i = 0
    while i < count
      newCharacter = doc.createElement("ul")
      newCharacter.className = "cd"
      newCharacter.id = divId + "_d" + i
      newCharacter.innerHTML = '<li class="t" id="' + divId + '_t_d' + i + '"></li><li class="b" id="' + divId + "_b_d" + i + '"></li>'
      div.insertBefore newCharacter, div.firstChild
      i++
    i = 0
    while i < count
      doc.getElementById(divId + "_t_d" + i).style.backgroundPosition = "-" + (chars[o.padChar].column * o.cW) + "px -" + (chars[o.padChar].row * o.tFH) + "px"
      doc.getElementById(divId + "_b_d" + i).style.backgroundPosition = "-" + ((chars[o.padChar].column * o.cW) + (o.fW * 3)) + "px -" + (chars[o.padChar].row * o.bFH) + "px"
      o.currentMessage = o.currentMessage + o.padChar
      i++
    nextCount = setTimeout(messageDisplay, o.hold)  if o.auto is true
    
    # clear a Timer
    
  clearNext = ->
    clearTimeout nextChange
    nextChange = null
    
  isNumber = (n) ->
    not isNaN(parseFloat(n)) and isFinite(n)
    
  
  @addMessage = (s, priority, style) ->
    newPadded = " "
    newLine = s.toString()
    p = (if isNumber(priority) then priority else 0)
    if newLine.length < o.displayWidth
      newPadded = addPad(newLine)
      newLine = newPadded
    newLine = newLine.substr(0, o.displayWidth)  if newLine.length > o.displayWidth
    switch p
      when 0
        messagesRegular.push newLine
      when 1
        messagesUrgent.push newLine
      else
        messagesRegular.push newLine
    this

  @setPace = (n) ->
    o.pace = (if isNumber(n) then n else defaults.pace)
    this

  @setDisplayWidth = (n) ->
    o.DisplayWidth = (if isNumber(n) then n else defaults.displayWidth)
    this

  @setAuto = (a) ->
    if a and not o.auto
      o.auto = true
      messageChange()
    if not a and o.auto
      clearNext()  if nextChange
      o.auto = false
    this

  displaySet()

# originalish chat code below


exports.init = ->
  
  $('#demo').hide()
  
  myDisplay = new flipDisplay('flip-display',{pace:100, auto:true, displayWidth:15, hold: 5000})

  # Listen out for newMessage events coming from the server
  ss.event.on 'newMessage', (params) ->
    username = params.user
    message = params.body
    console.log(username)
    # Example of using the Hogan Template in client/templates/chat/message.jade to generate HTML for each message
    html = HT['chat-message'].render({username: username, message: message, time: -> timestamp() })

    # Append it to the #chatlog div and show effect
    $(html).hide().appendTo('#chatlog').slideDown()
    
    # Send it to the flip-display
    myDisplay.addMessage(params.body, 0)
    
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