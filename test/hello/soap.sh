#/bin/sh

curl --silent --header "Content-Type: text/xml;charset=UTF-8" \
     --header "SOAPAction: helloOperation" \
     --data @/home/herbert/ace/test/hello/soap.xml \
     http://localhost:7801/soapService \
	| xmllint --format - > /ace/test/hello/soap.xml

