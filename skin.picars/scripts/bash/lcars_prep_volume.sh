#!/bin/bash
#From http://www.oxymoronical.com/blog/2013/01/Pop-free-sound-from-a-Raspberry-Pi-running-XBMC
######################################################
# Name: lcars_prep_volume.sh - Plagurized by J. Askew
# 
export VERSION=kodi    ## Latest version is KODI -Helix, so xbmc becomes--kodi
export SCRIPT_DIR=/home/osmc/.kodi/addons/skin.picars/scripts/bash
export MY_SCRIPT=`basename $0`
export VAR1="snd-bcm2835"
export WHOAMI=`whoami`
# Ensure running as user pi and not root or other.
 if [ ! ${WHOAMI} == 'osmc' ];then
    echo "Aborted, not running as user=osmc"
        exit
 fi
# Check VERSION for right directories
 if [ ! -d $HOME/.${VERSION} ]; then
     echo "###--------------------------------------###" > $HOME/abort.log
     echo "${MY_SCRIPT} expecting directory $HOME/.${VERSION} to exist; not found, aborting" >> $HOME/abort.log
     echo "###--------------------------------------###" >> $HOME/abort.log
     cat $HOME/abort.log
         exit
 fi
# Check if we exist, if not, abort with message.
 if [ ! -d $SCRIPT_DIR ]; then
    echo "###--------------------------------------###" >>$HOME/.${VERSION}/temp/${VERSION}.log
    echo "### Message from ${SCRIPT_DIR}/${MY_SCRIPT} ###" >>$HOME/.${VERSION}/temp/${VERSION}.log
    echo "${MY_SCRIPT} aborted; directory expecting ${SCRIPT_DIR}" >>$HOME/.${VERSION}/temp/${VERSION}.log
    echo "###--------------------------------------###" >> $HOME/abort.log
    echo "${MY_SCRIPT} aborted; directory expecting ${SCRIPT_DIR}"
         exit
 fi
 export PATH=$PATH:${SCRIPT_DIR}
 cd ${SCRIPT_DIR}
 chmod 711 ./lcars_prep_volume.sh
 sudo grep -q "lcars_prep_volume.sh" ~/.bashrc || echo "${SCRIPT_DIR}/${MY_SCRIPT}" >> ~/.bashrc
 if [[ ! -a /etc/modules.pristine ]];then
	sudo cp -p /etc/modules /etc/modules.pristine
 fi
 #sudo grep -q "${VAR1}" /etc/modules || sudo echo "${VAR1}" >> /etc/modules
 #echo grep  "${VAR1}" /etc/modules|wc -l
 myCNT=`grep  "${VAR1}" /etc/modules|wc -l`

 if [[  ${myCNT} -eq 0  ]]; then
	echo "${VAR1}" | sudo tee -a /etc/modules
	sudo sed -i 's/^\(load-module module-udev-detect\)/\1 tsched=0/' /etc/pulse/system.pa
	sudo modprobe "${VAR1}" 
 fi
         
 sudo perl -pe 's/^(load-module module-suspend-on-idle)/#$1/g' -i /etc/pulse/system.pa
 sudo perl -pe 's/fvolumelevel\>0....../fvolumelevel\>0\.999999/g' -i ${HOME}/.${VERSION}/userdata/guisettings.xml
