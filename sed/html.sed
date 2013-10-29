<html><head><title>Hello World</title>
<body>Welcome to the world of regexp!</body></html>
sed 's/.*[^>]>\([^>].*[^><]\)<\/[^<].*/\1/g' testfile
