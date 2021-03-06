#!/bin/bash
cat > ~/ip.txt <<\ips
10.13.0.146   hdp001.mweibo.bx.sinanode.com
10.13.0.147   hdp002.mweibo.bx.sinanode.com
10.13.0.148   hdp003.mweibo.bx.sinanode.com
10.13.0.149   hdp004.mweibo.bx.sinanode.com
10.13.0.150   hdp005.mweibo.bx.sinanode.com
10.13.0.151   hdp006.mweibo.bx.sinanode.com
10.13.0.152   hdp007.mweibo.bx.sinanode.com
10.13.0.153   hdp008.mweibo.bx.sinanode.com
10.13.0.154   hdp009.mweibo.bx.sinanode.com
10.13.0.161   hdp010.mweibo.bx.sinanode.com
10.13.0.162   hdp011.mweibo.bx.sinanode.com
10.13.0.163   hdp012.mweibo.bx.sinanode.com
10.13.0.166   hdp013.mweibo.bx.sinanode.com
10.13.0.167   hdp014.mweibo.bx.sinanode.com
10.13.0.168   hdp015.mweibo.bx.sinanode.com
10.13.0.169   hdp016.mweibo.bx.sinanode.com
10.13.0.170   hdp017.mweibo.bx.sinanode.com
10.13.0.171   hdp018.mweibo.bx.sinanode.com
10.13.0.172   hdp019.mweibo.bx.sinanode.com
10.13.0.173   hdp020.mweibo.bx.sinanode.com
10.13.0.174   hdp021.mweibo.bx.sinanode.com
10.13.0.175   hdp022.mweibo.bx.sinanode.com
10.13.0.176   hdp023.mweibo.bx.sinanode.com
10.13.0.177   hdp024.mweibo.bx.sinanode.com
10.13.0.178   hdp025.mweibo.bx.sinanode.com
10.13.0.179   hdp026.mweibo.bx.sinanode.com
10.13.0.180   hdp027.mweibo.bx.sinanode.com
10.13.0.182   hdp028.mweibo.bx.sinanode.com
10.13.0.183   hdp029.mweibo.bx.sinanode.com
10.13.0.184   hdp030.mweibo.bx.sinanode.com
10.13.0.185   hdp031.mweibo.bx.sinanode.com
10.13.0.186   hdp032.mweibo.bx.sinanode.com
10.13.0.187   hdp033.mweibo.bx.sinanode.com
10.13.0.188   hdp034.mweibo.bx.sinanode.com
10.13.0.189   hdp035.mweibo.bx.sinanode.com
10.13.0.190   hdp036.mweibo.bx.sinanode.com
10.13.0.191   hdp037.mweibo.bx.sinanode.com
10.13.0.221   hdp038.mweibo.bx.sinanode.com
10.13.0.222   hdp039.mweibo.bx.sinanode.com
10.13.0.223   hdp040.mweibo.bx.sinanode.com
10.13.0.224   hdp041.mweibo.bx.sinanode.com
10.13.0.225   hdp042.mweibo.bx.sinanode.com
10.13.0.226   hdp043.mweibo.bx.sinanode.com
10.13.0.227   hdp044.mweibo.bx.sinanode.com
10.13.0.228   hdp045.mweibo.bx.sinanode.com
10.13.0.229   hdp046.mweibo.bx.sinanode.com
10.13.0.230   hdp047.mweibo.bx.sinanode.com
10.13.0.231   hdp048.mweibo.bx.sinanode.com
10.13.0.232   hdp049.mweibo.bx.sinanode.com
10.13.0.233   hdp050.mweibo.bx.sinanode.com
10.13.0.234   hdp051.mweibo.bx.sinanode.com
10.13.0.235   hdp052.mweibo.bx.sinanode.com
10.13.0.236   hdp053.mweibo.bx.sinanode.com
10.13.0.237   hdp054.mweibo.bx.sinanode.com
10.13.0.238   hdp055.mweibo.bx.sinanode.com
10.13.0.239   hdp056.mweibo.bx.sinanode.com
10.13.0.240   hdp057.mweibo.bx.sinanode.com
10.13.1.57    hdp058.mweibo.bx.sinanode.com
10.13.1.93    hdp059.mweibo.bx.sinanode.com
10.13.1.94    hdp060.mweibo.bx.sinanode.com
10.13.40.79   hdp061.mweibo.bx.sinanode.com
10.77.96.73   hdp062.mweibo.bx.sinanode.com
10.77.96.74   hdp063.mweibo.bx.sinanode.com
10.77.96.75   hdp064.mweibo.bx.sinanode.com
10.77.96.76   hdp065.mweibo.bx.sinanode.com
10.77.96.77   hdp066.mweibo.bx.sinanode.com
10.77.96.78   hdp067.mweibo.bx.sinanode.com
10.77.96.79   hdp068.mweibo.bx.sinanode.com
10.77.96.80   hdp069.mweibo.bx.sinanode.com
ips
cd ~
ip1=$(ifconfig eth0|grep 'inet addr'|awk -F: '{print $2}'|awk '{print $1}')
echo $ip1
host=$(cat ip.txt|awk -v ip1="$ip1" '{if(ip1==$1) print $2}')
echo $host
sed -i '/^HOSTNAME/d' /etc/sysconfig/network
echo 'HOSTNAME='${host} >>/etc/sysconfig/network
hostname $host
