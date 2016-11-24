#!/bin/bash
#
# *******************************************************
# raspberry's pi humble stress tester & temperature monitoring
# is your pi's overclock stable?
# this is a poor man's textmode test (good for terminal's ssh 
# 2012-october-22, by test666
# *******************************************************
#
#BSD license, modified
#
#Copyright (c) 2012, test666
# All rights reserved.
#
#Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#Redistributions of source code must retain the above copyright notice, this list of conditions, the General Notes, The Disclaimer, the Personal notes, the Political note and the following disclaimer.
#Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#Neither the name of <test666> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# *******************************************************
#
# general notes
# 1 - see below 
#
# political note
# 1 - ubuntu unity REALLY, REALLY, REALLY sucks, OMG Ubuntu/Canonical, where are you heading and will I follow you?
# 1.1 - I'm using Lubuntu now, LXDE is OK, humble and super productive
# 2 - #1 NOT flame bait, just venting, cool it, keep it to yourself, no issue here, move along
#
# *******************************************************
#
# lines beginning with # are comments
#
# the previous line was a blank comment
#
# please do read the comments
#
# *******************************************************
#
## general notes
#
# *******************************************************
#
## raspberry's pi thermal monitoring & "overall" stability tester
#
# there are other tools, this is my humble way of stress testing the pi
#
# copy/paste into vim, nano, leafpad, gedit, whatever you like as an editor
#
# save as [/path/]pi_stress_test.sh
# (/home/pi/my_scripts/pi_stress_test.sh)
#
# make it executable with:
# chmod +x [/path/]pi_stress_test.sh
# or
# make it executable with a gui file manager (pcmanfm or whatever)
#
# execute in a terminal window:
# [/path/]pi_stress_test.sh
# or
# ./pi_stress_test.sh
# or
# use a gui file manager
#
# *******************************************************
#
## IF YOU ARE NOT REDISTRIBUTING THIS SCRIPT
# please do feel free [ :-)) ] to remove all the comments
#
# *******************************************************
#
## Is there a parameter in your pockett? ;-))
#
## test if the user wants the temperature in 
# celsius or fahrenheit:
# no parameter -> celsius
# parameter letter f -> fahrenheit
#
if [ $# -gt 1 ]
   then
      {
         echo ""
         echo "error : only ONE allowed parameter: letter f for fahrenheit"
         echo ""
         echo "press <enter> to exit"
         read
         exit
       }
fi
if [ $# -eq 1 ]
	then
	   test_uk_temp=$1
		case $test_uk_temp in
		   f)
		      uk_temp_1="9/5"
		      uk_temp_2=32
			;;
			*)
            echo ""
            echo "error : wrong parameter: not the letter f for fahrenheit"
            echo ""
            echo "press <enter> to exit"
            read
            exit
		esac
   else
      uk_temp_1=1
      uk_temp_2=0
fi
#
# *******************************************************
#
## hello world
#
clear
tput cup 1 15
printf "raspberry pi stress test & temperature visualization"
tput cup 3 28
printf "press any key to exit"
tput cup 7 27
printf "Initial temperature was"
tput cup 8 40
temperature=""
while [ -z "$temperature" ]
   do
      temperature="$(cat /sys/class/thermal/thermal_zone0/temp)"
   done
temperature="$(($temperature/1000*$uk_temp_1+$uk_temp_2))"
printf "$temperature"
tput cup 9 40
if [ $uk_temp_1 = "1" ]
   then 
      printf "celsius"
   else 
      printf "fahrenheit"
fi
tput cup 11 27
printf "Current temperature is"
#
# *******************************************************
#
## stress the pi cpu
#
# set here the number of concurrent cpu intensive processes
#
# too many and the computer may crash or become unresponsive,
# but it may also be the sign that the pi's overclocking is unstable
#
# default level is one batch of concurrent cpu intensive processes
#
dd_pi_stress_level=1
for (( i  = 1; i <= $dd_pi_stress_level ; i++ ))
      do
         md5sum < /dev/urandom &
         cat /dev/urandom | gzip > /dev/null &
         dd if=/dev/urandom of=/dev/null bs=16M &
      done
#
# *******************************************************
#
## put standard input (keyboard) in non-blocking mode
#
if [ -t 0 ]
   then
      stty -echo -icanon time 0 min 0
   fi
#
# *******************************************************
#
## display temperature in Celsius or Fahrenheit
#
tput cup 13 40
if [ $uk_temp_1 = "1" ]
   then 
      printf "celsius"
   else 
      printf "fahrenheit"
fi
keypressed=""
while [ "x$keypressed" = "x" ]
   do
      tput cup 12 40
      temperature=""
      while [ -z "$temperature" ]
         do
            temperature="$(cat /sys/class/thermal/thermal_zone0/temp)"
         done
      temperature="$(($temperature/1000*$uk_temp_1+$uk_temp_2))"
      echo "$temperature      "
      tput cup 12 45
      sleep 1
      read keypressed
   done
#
# *******************************************************
#
## restore standard input default mode
if [ -t 0 ]
   then 
      stty sane
fi
#
# *******************************************************
#
clear
echo "Exiting. Please wait..."
#
# *******************************************************
#
# kill all cpu intensive processes
#
test=""
while [ "$test" != "md5sum: no process found" ]
   do
      test=$(killall -9 md5sum 2>&1 >/dev/null)
   done
#
test=""
while [ "$test" != "gzip: no process found" ]
   do
      test=$(killall -9 gzip 2>&1 >/dev/null)
   done
#
test=""
while [ "$test" != "dd: no process found" ]
   do
      test=$(killall -9 dd 2>&1 >/dev/null)
   done
#
# *******************************************************
#
## exiting
#
clear
exit 0


