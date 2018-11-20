var http = require('http');
 var os = require("os"); var hostname1 = os.hostname(); 
http.createServer(function (req, res) 
{
  if(req.method === "GET" && req.url==="/health")
  {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('APPSERV OK');
  }
  else
  if(req.method === "GET" && req.url==="/error")
  {
    res.isto_eh_erro();
  }
  else
  if(req.method === "GET" && req.url==="/time")
  {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    var currentdate = new Date(); 
    var datetime = 
                 currentdate.getFullYear() + "-"  + (currentdate.getMonth()+1)  + "-"  +  currentdate.getDate() + "-"
                + currentdate.getHours() + "-" + currentdate.getMinutes() + "-"  + currentdate.getSeconds();

     res.write('{"Hello","'+datetime+'"}');
     res.write('{"Host ","'+hostname1+'"}');
     res.end('');
     console.log(datetime);
  }
 else
 {
    res.writeHead(404, 'Resource Not Found', {'Content-Type': 'text/plain'});
    res.end('{"Status":"not found"}');
 }
   
}
).listen(9999);

console.log('Server running at http://localhost:9999/');
