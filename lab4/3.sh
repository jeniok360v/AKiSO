#!/bin/bash

 
curl -o cat.json 2>/dev/null https://api.thecatapi.com/v1/images/search
var=$(jq -r '.[] | .url' cat.json)
curl -o cat.jpg 2>/dev/null $var
 
img2txt cat.jpg


curl -o joke.json 2>/dev/null http://api.icndb.com/jokes/random
cat joke.json | jq '. | {joke: .value.joke}' 
