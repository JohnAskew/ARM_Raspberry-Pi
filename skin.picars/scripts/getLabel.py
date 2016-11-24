import xbmc

locstr1 =  xbmc.getInfoLabel('System.CurrentWindow' + 'System.CurrentControl')
print locstr1
xbmc.executebuiltin('Notification('+ locstr1 +' , '+ cmd +', 4000,/home/osmc/.kodi/addons/skin.picars/lcars/avi/yellow.gif)')
