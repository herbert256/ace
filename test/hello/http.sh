#/bin/sh

curl --silent --header "Content-Type: text/xml;charset=UTF-8" \
     --data @/home/herbert/ace/test/hello/hello.xml \
     http://localhost:7803/httpService \
	| xmllint --format - > /ace/test/hello/http.xml