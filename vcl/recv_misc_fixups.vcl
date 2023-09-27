# Remove all query arguments to increase cache hit ratios. This may need to be changed/undone in case Image Opto is used
set req.url = querystring.remove(req.url);

# Block any HTTP verbs on on the approved list. No need to forward that back to the origin
if (req.request != "HEAD" && req.request != "GET" && req.request != "FASTLYPURGE") {
  error 404;
}

# We only serve static media files. Block everything else
if (req.url.ext ~ "(?i)^(jpe?g|png|gif|mp4|mp3|gz|svg|avif|webp)$") {

} else {
  error 404;
}

# Remove all headers we don't care to be passing around. It does not remove protected headers. More details
# https://developer.fastly.com/reference/vcl/functions/headers/header-filter-except/
header.filter_except(req, "Accept-Encoding");
