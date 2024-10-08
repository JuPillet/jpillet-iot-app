echo "echo \$0: $0"
echo "echo \$1: [\"$(echo "$1" | sed 's/, /,/g' | sed 's/,/","/g')\"]"
echo "echo \$2: $2"
echo "echo \$3: $3"