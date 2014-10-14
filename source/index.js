var express = require('express');
var elasticsearch = require('elasticsearch');
var client = new elasticsearch.Client({
  host: 'jinx:bl4h0nga@db:9200',
  log: 'trace'
});

client.indices.create({
  index: 'myindex'
}).then(function() {
    client.index({
      index: 'myindex',
      type: 'mytype',
      id: '1',
      body: {
        title: 'Test 1',
        tags: ['y', 'z'],
        published: true,
        published_at: '2013-01-01',
        counter: 1
      }
    });
});

var app = express();

app.get('/', function(req, res){
	client.get({
	  index: 'myindex',
	  type: 'mytype',
	  id: 1
	}, function (error, response) {
		res.json(response);
	});
});

console.log("Listening on port 8080...");

app.listen(8080);