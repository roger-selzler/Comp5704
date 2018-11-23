#for i in "192.168.6.19" "192.168.6.20" "192.168.6.21" "192.168.6.22"

for i in "192.168.6.20" "192.168.6.21" "192.168.6.22"
do
  echo $i
  echo "Copying file $1 to computer $i"
  scp $1 rogerselzler@$i:/home/rogerselzler/comp5704
  echo "files copied..."
done

python trainer.py --ps_hosts=192.168.6.19:2222  --worker_hosts=192.168.6.19:2222,192.168.6.20:2222  --job_name=ps     --task_index=0
python trainer.py --ps_hosts=192.168.6.19:2222  --worker_hosts=192.168.6.19:2222,192.168.6.20:2222  --job_name=worker --task_index=0
ssh rogerselzler@$192.168.6.20 "cd comp5704;ls;\
python trainer.py --ps_hosts=192.168.6.19:2222  --worker_hosts=192.168.6.19:2222,192.168.6.20:2222  --job_name=worker --task_index=1"



#for i in "134.117.217.27" "134.117.217.28"  "134.117.217.30"
