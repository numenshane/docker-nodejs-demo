'use strict';
const express = require('express');

// Constants
const PORT = 8088;

// App
const app = express();
app.get('/', function (req, res) {
	//res.send('Hello world!\n');
	res.send(req_body);
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);

var os = require('os');
var ifaces = os.networkInterfaces();

var S = require('string');
var req_body = "Hello world v0 !\n";

req_body = req_body + S('    The real server ip within container behind LB is \n\n');

Object.keys(ifaces).forEach(function (ifname) {
  var alias = 0;

  ifaces[ifname].forEach(function (iface) {
    if ('IPv4' !== iface.family || iface.internal !== false) {
      // skip over internal (i.e. 127.0.0.1) and non-ipv4 addresses
      return;
    }

    if (alias >= 1) {
      // this single interface has multiple ipv4 addresses
      console.log(ifname + ':' + alias, iface.address);
      req_body = req_body + ifname + ':' + alias + iface.address + '    \n'; 
    } else {
      // this interface has only one ipv4 adress
      console.log(ifname, iface.address);
      req_body = req_body + ifname + ' : ' + iface.address + '    \n';
    }
    ++alias;
  });
});


