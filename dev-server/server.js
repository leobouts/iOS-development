var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.all('/*', function(req, res, next) {

    res.header("Acces-Control-Allow-Origin", "*");
    res.header("Acces-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
    res.header("Acces-Control-Allow-Methods", "POST, GET");
    next();
    
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var tutorials = [
    {
        id: 1,
        title: "sad cooking show",
        description: "thats really sad",
        thumbnail: "https://i.ytimg.com/an_webp/Xtrsh4U_GCY/mqdefault_6s.webp?du=3000&sqp=CMrVhM8F&rs=AOn4CLAkWDDNvPuCzwPZ1la0-zHXJnaYXQ",
        iframe: '<iframe width="560" height="315" src="https://www.youtube.com/embed/Xtrsh4U_GCY" frameborder="0" allowfullscreen></iframe>'

    }
];

app.get('/tutorials', function(req, res) {

    console.log("GET from server");
    res.send(tutorials);

});

app.listen(6069); //pick any port like above 3000-5000