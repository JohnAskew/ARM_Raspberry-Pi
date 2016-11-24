import xbmc, time
time.sleep(0.5)
xbmc.executebuiltin("Notification(ATTENTION, Processing, 2000,/home/osmc/.kodi/addons/skin.picars/lcars/avi/yellow.gif)")
if  not xbmc.Player().isPlaying() :
    xbmc.playSFX('/home/osmc/.kodi/addons/skin.picars/lcars/wav/tos-lcars-accessing-files.wav')
