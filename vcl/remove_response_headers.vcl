unset beresp.http.x-amz-id-2;
unset beresp.http.x-amz-request-id;
unset beresp.http.x-amz-meta-server-side-encryption;
unset beresp.http.x-amz-server-side-encryption;
unset beresp.http.x-amz-bucket-region;
unset beresp.http.x-amzn-requestid;

# Set the Caching policy for all files
set beresp.http.Cache-Control = "public, max-age=315576000, immutable";
