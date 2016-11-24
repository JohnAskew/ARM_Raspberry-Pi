import xbmc
if  not xbmc.Player().isPlaying() :
    xbmc.executebuiltin("PlayMedia(/home/osmc/.kodi/addons/skin.picars/lcars/wav/gen_comm/lcars_enter_when_ready.wav)")
