import xbmc, time
time.sleep(0.5)
if  not xbmc.Player().isPlaying() :
    xbmc.playSFX('/home/osmc/.kodi/addons/skin.picars/lcars/wav/lcars_cancelled.wav')
    time.sleep(0.5)
    xbmc.executebuiltin("PlayMedia(/home/osmc/.kodi/addons/skin.picars/lcars/wav/lcars_swoosh.mp3)")
