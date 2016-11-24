import xbmc,  os, subprocess, time

locstr1 =  xbmc.getInfoLabel('system.addontitle(Skin.String(HomeVideosButton1))')
myURL = "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=" + locstr1
subprocess.call(['wget', '-q', '-U Mozilla', '-O', myDir, myURL])
xbmc.executebuiltin('Notification('+ locstr1 +' , '+ cmd +', 10000,/home/osmc/.kodi/addons/skin.picars/lcars/avi/yellow.gif)')
xbmc.executebuiltin("PlayMedia(/home/osmc/.kodi/addons/skin.picars/lcars/wav/output.mp3)")

