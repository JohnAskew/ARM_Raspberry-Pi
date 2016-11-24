#!/usr/bin/env python
import xbmc, xbmcgui
import simplejson
#-----------------------------#
# If not playing, just delete cache
#-----------------------------#
if  not xbmc.Player().isPlaying() :
    xbmc.executebuiltin('RunPlugin(plugin://plugin.video.xbmchubmaintenance/?mode=4&url=url)')
    exit(0)

###############################
# Get Player Info
##############################
jsonSWAT_PlayerId = xbmc.executeJSONRPC('{"jsonrpc": "2.0", "method": "Player.GetActivePlayers", "id": 1}')
print jsonSWAT_PlayerId
#------------------------------#
# Parse Player Info
#------------------------------#
json_response = unicode(jsonSWAT_PlayerId, 'utf-8', errors='ignore')
data = simplejson.loads(json_response)
if data['result']:
    print "has_key value"
    player_id = data['result'][0]["playerid"]
    print  player_id
    xbmcgui.Dialog().ok('Cache Maintenance','The next window will show Maintenance completion...THEN Click "Play" to continue')
    xbmc.Player().pause()
    xbmc.executebuiltin('RunPlugin(plugin://plugin.video.xbmchubmaintenance/?mode=4&url=url)')
