#!/usr/bin/env python
import xbmc
import simplejson
myHeader='Informational'
myText='Current Audio using --> '
myTime=2000
myIcon='/home/osmc/.kodi/addons/skin.picars/lcars/warn/green.gif'
###############################
# Get Player Info
##############################
jsonSWAT_PlayerId = xbmc.executeJSONRPC('{"jsonrpc":"2.0","method":"Settings.GetSettingValue", "params":{"setting":"audiooutput.audiodevice"},"id":1}')
#print jsonSWAT_PlayerId
json_response = unicode(jsonSWAT_PlayerId, 'utf-8', errors='ignore')
#print json_response
data = simplejson.loads(json_response)
#print data
myAudio =  data['result']['value']
#print myAudio
myText = myText + myAudio
xbmc.executebuiltin("XBMC.Notification(%s,%s,%i,%s)"%( myHeader, myText , myTime, myIcon ))

#xbmc.executeJSONRPC(jsonSWAT_Notify % myAudio)
