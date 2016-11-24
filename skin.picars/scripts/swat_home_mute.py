import xbmc
xbmc.executebuiltin(SetVolume(0,1))
xbmc.playSFX('/home/osmc/.kodi/addons/skin.picars/lcars/wav/tos-lcars-incoming-msg.WAV')
xbmc.executebuiltin("Notification(Completed,End of Transmission,4000,/home/osmc/.kodi/addons/skin.picars/lcars/avi/lcars-side.png)")
