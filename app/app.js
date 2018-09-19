const fs = require('fs');

const timestamp = Math.floor(Date.now() / 1000);

fs.appendFile('timestamp.txt', timestamp + '\n', function (err) {
  if (err) throw err;
});