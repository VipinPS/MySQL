#!/bin/bash

FILENAME=$1

openssl pkcs12 -in $FILENAME -nocerts -nodes | sed -ne '/-BEGIN PRIVATE KEY-/,/-END PRIVATE KEY-/p' > $FILENAME.key
openssl pkcs12 -in $FILENAME -clcerts -nokeys | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > $FILENAME.crt
openssl pkcs12 -in $FILENAME -cacerts -nokeys -chain | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > $FILENAME.ca.crt
