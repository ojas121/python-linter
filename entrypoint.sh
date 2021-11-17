#!/bin/bash

set -e

# source = $1
# strict = $2
# mypy-options = $3
# pylint-options = $4
# black-options = $5
# isort-options = $6
# django = $7

echo "===== Running Python Linter - '$2' ====="
echo "Django project? '$7'"

echo "Installing dependencies"
pip install -r ./requirements.txt
if [ "$2" = "high" ]; then
  echo "Running pylint"
  pylint "$1" ${4}
  
elif [ "$2" = "medium" ]; then
  echo "Running pylint"
  pylint "$1" --fail-under=8 ${4}

else
  echo "Running pylint"
  pylint "$1" --exit-zero ${4}
fi

echo "Done 🎉" ; echo ""
