// My SocketStream app

var http = require('http')
  , ss = require('socketstream');

// Define a single-page client
ss.client.define('main', {
  view: 'app.jade',
  css:  ['libs', 'app.styl'],
  code: ['libs', 'app'],
  tmpl: '*'
});

// Serve this client on the root URL
ss.http.router.on('/', function(req, res) {
  res.serveClient('main');
});
    
// Remove to use only plain .js, .html and .css files if you prefer
ss.client.formatters.add(require('ss-coffee'));
ss.client.formatters.add(require('ss-jade'));
ss.client.formatters.add(require('ss-stylus'));

// Use server-side compiled Hogan (Mustache) templates. Others engines available
ss.client.templateEngine.use(require('ss-hogan'));

// Minimize and pack assets if you type: SS_ENV=production node app.js
if (ss.env == 'production') ss.client.packAssets();

ss.session.store.use('redis');

ss.http.middleware.prepend(ss.http.connect.bodyParser());

// Start web server
var server = http.Server(ss.http.middleware);
server.listen(3000);

// Start SocketStream
ss.start(server);

var pushServerTime = function() {
		ss.api.publish.all('newServerTime', timestamp());
		return(true);
};

var clocktick = setInterval(pushServerTime, 1000);

// Private Functions

var pad2 = function(number) {
	return (number < 10 ? '0' : '') + number;
};

var timestamp = function() {
  var d = new Date();
  return d.getHours() + ':' + pad2(d.getMinutes()) + ':' + pad2(d.getSeconds());
};