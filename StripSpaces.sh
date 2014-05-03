#!/bin/bash
# remove spaces from all names
for a in *$1; do 
  echo Converting "$a" to "${a// /_}"
  mv "$a" "${a// /_}"
done