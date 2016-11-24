import xbmc, time
time.sleep(0.75)
if  not xbmc.Player().isPlaying() :
    xbmc.executebuiltin("PlayMedia(/home/osmc/.kodi/addons/skin.picars/lcars/wav/home/main_lcars.mp3)")
