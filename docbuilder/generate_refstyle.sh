#!/bin/bash
DESTINATION=$1
REFSTYLE=$2

echo "Generating reference style..."
echo "Destination: ${DESTINATION}"
# Set REFSTYLE to 'all' if it is empty
if [ -z "${REFSTYLE}" ]; then
  REFSTYLE="all"
fi

echo "Reference Style: ${REFSTYLE}"

mkdir -p styles/${DESTINATION}

case "${REFSTYLE}" in
  "all")
    echo "No reference style specified, generating 'all'"
#    ${REFSTYLE}='all'
    ;;
  "docx")
    echo "DOCX trebuie"
    ;;
  *)
    echo "Unknown reference style: ${REFSTYLE}"
    exit 1
    ;;
esac