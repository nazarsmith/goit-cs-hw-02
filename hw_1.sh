#!/bin/bash

webpages=("https://www.google.com" "https://www.facebook.com" "https://www.imdb.com")
len_pages=${#webpages[@]}

for ((i=0; i<len_pages; i++))
do
  status="$(curl -s --head "${webpages[i]}" | grep "HTTP/1.1 [0-9]* [a-zA-Z]*")"
  if [[ $status == *"200"* ]]
  then
    echo "${webpages[i]} is UP" >> "$(pwd)/result.log"
  elif [[ $status == *"401"* ]]
  then
    echo "${webpages[i]} AUTHENTICATION required" >> "$(pwd)/result.log"
  elif [[ $status == *"403"* ]]
  then
    echo "${webpages[i]} has FORBIDDEN access to the resource" >> "$(pwd)/result.log"
  elif [[ $status == *"404"* ]]
  then
    echo "${webpages[i]} was NOT FOUND" >> "$(pwd)/result.log"
  elif [[ $status == *"503"* ]]
  then
    echo "${webpages[i]} is UNAVAILABLE" >> "$(pwd)/result.log"
  else
    echo "Something went WRONG when trying to reach ${webpages[i]}" >> "$(pwd)/result.log"
  fi
done
echo "Done."
