# To print all 4T drives on the same line
lsblk | grep 4T | grep disk | awk 'BEGIN { ORS=" " }; {print $1}'
# To print all and add "1" at the end
lsblk | grep 4T | grep disk | awk 'BEGIN { ORS=" " }; {print $1"1"}'
# Mount 12 disks of E5700
j=1
for i in c1 d1 e1 f1 g1 h1 j1 k1 l1 m1 n1 o1; do ~/git/NetApp_TME/disks/create_mountPoint.bash sda$i disk$j; j=$(($j+1)); done
