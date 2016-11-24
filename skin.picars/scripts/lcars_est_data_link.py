import xbmc
if  not xbmc.Player().isPlaying() :
    xbmc.playSFX('/home/osmc/.kodi/addons/skin.picars/lcars/wav/lcars_est_data_link.wav')
