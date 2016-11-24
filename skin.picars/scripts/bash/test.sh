#!/bin/bash
my_Vcgencmd=`which vcgencmd`
my_ETH=`ifconfig|grep encap|grep -v lo|awk '{print $1}'`
sudo ${my_Vcgencmd} get_config arm_freq
sudo ${my_Vcgencmd} measure_temp
 echo -e "MAC Addr=\c"
sudo cat /sys/class/net/${my_ETH}/address
sudo cat /boot/config.txt
 echo -e "Memory Split: \c"
sudo ${my_Vcgencmd} get_mem arm 
 echo -e "Memory Split: \c"
sudo ${my_Vcgencmd} get_mem gpu
for src in arm core h264 isp v3d uart pwm emmc pixel vec hdmi dpi
    {
        echo -e "$src:\t$(${my_Vcgencmd} measure_clock $src)"
    }
 for id in core sdram_c sdram_i sdram_p
    {
        echo -e "$id:\t$(${my_Vcgencmd} measure_volts $id)"
    }
 for codec in H264 MPG2 WVC1 MPG4 MJPG WMV9
    {
        echo -e "$codec:\t$(${my_Vcgencmd} codec_enabled $codec)"
    }
