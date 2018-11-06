echo "first argument $1"
echo "first argument $2"



#gpu1="134.117.217.26"
#gpu2="134.117.217.27"
#gpu3="134.117.217.28"
#gpu4="134.117.217.30"
echo "Generating new key - answer as requested"
ssh-keygen -t rsa


for i in "134.117.217.27" "134.117.217.28"  "134.117.217.30"
do
   ssh-copy-id rogerselzler@$i
done
