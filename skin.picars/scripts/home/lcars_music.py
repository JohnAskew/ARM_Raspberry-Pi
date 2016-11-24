import xbmc
if  not xbmc.Player().isPlaying() :
    xbmc.executebuiltin("PlayMedia(/home/osmc/.kodi/addons/skin.picars/lcars/wav/home/main_music.mp3,1)")
