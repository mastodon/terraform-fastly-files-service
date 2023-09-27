if (req.method == "GET" && !req.backend.is_shield) {
  set bereq.url = "/${hostname}" + req.url;
}
