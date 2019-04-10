#!/bin/bash

set -x

IP=$(ifconfig | awk '/inet/ { print $2 }' | egrep -v '^fe|^127|^192|^172|::' | head -1)
IP=${IP#addr:}

if [[ $HOSTNAME == "node"* ]] ; then 
    #rightscale
    IP=$(grep $(hostname)_ext /etc/hosts | awk '{print $1}')
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    IP=localhost
fi

# Swap out your file name here
curl -H "Accept-Encoding: gzip" -X POST -F 'file=@notebooks/Search_Workshop_Lab_1_Search-enabling_the_customer-facint_application.tar' http://"$IP":9091/api/v1/notebooks/import &> /dev/null
curl -H "Accept-Encoding: gzip" -X POST -F 'file=@notebooks/Search_Workshop_Lab_2_Full-text_search.tar' http://"$IP":9091/api/v1/notebooks/import &> /dev/null
curl -H "Accept-Encoding: gzip" -X POST -F 'file=@notebooks/Search_Workshop_Lab_3_Facets.tar' http://"$IP":9091/api/v1/notebooks/import &> /dev/null
curl -H "Accept-Encoding: gzip" -X POST -F 'file=@notebooks/Search_Workshop_Lab_4_Geospatial_Search.tar' http://"$IP":9091/api/v1/notebooks/import &> /dev/null