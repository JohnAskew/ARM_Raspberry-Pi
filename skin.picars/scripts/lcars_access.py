import xbmc, xbmcgui
if  not xbmc.Player().isPlaying() :
    xbmc.executebuiltin("Notification(ATTENTION, Processing, 2000,/home/osmc/.kodi/addons/skin.picars/lcars/avi/yellow.gif)")
    xbmc.playSFX('/home/osmc/.kodi/addons/skin.picars/lcars/wav/tos-lcars-accessing-files.wav')
