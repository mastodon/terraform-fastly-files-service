# Set CORS headers only if client sends the Origin Header and only if we are executing on the edge
if ( fastly.ff.visits_this_service == 0 && req.http.Origin ) {
  set resp.http.Access-Control-Allow-Origin = "*";
  set resp.http.Access-Control-Allow-Methods = "GET";
  set resp.http.Access-Control-Allow-Headers = "DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type";
}
