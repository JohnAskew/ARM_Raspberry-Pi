#!/usr/bin/env python
import xbmc, xbmcgui
import simplejson
###############################
# Get Player Info
##############################
jsonSWAT_PlayerId = xbmc.executeJSONRPC('{"jsonrpc":"2.0","method":"Settings.GetSettingValue", "params":{"setting":"audiooutput.audiodevice"},"id":1}') 
print jsonSWAT_PlayerId
#------------------------------#
# Parse Player Info
#------------------------------#
json_response = unicode(jsonSWAT_PlayerId, 'utf-8', errors='ignore')
data = simplejson.loads(json_response)
if data['result']['value'] == "PI:Analogue":
    print "data['result']['value']=" + data['result']['value'] 
    xbmc.executeJSONRPC('{"jsonrpc":"2.0", "method":"Settings.SetSettingValue", "params":{"setting":"audiooutput.audiodevice", "value":"PI:HDMI"}, "id":1}')
    xbmc.executeJSONRPC('{"jsonrpc":"2.0", "method":"Settings.SetSettingValue", "params":{"setting":"audiooutput.passthrough","value":true}, "id":1}')
    jsonSWAT_PlayerId = xbmc.executeJSONRPC('{"jsonrpc":"2.0","method":"Settings.GetSettingValue", "params":{"setting":"audiooutput.audiodevice"},"id":1}') 
    print jsonSWAT_PlayerId
else:
    print "data['result']['value']=" + data['result']['value']
    xbmc.executeJSONRPC('{"jsonrpc":"2.0", "method":"Settings.SetSettingValue", "params":{"setting":"audiooutput.audiodevice", "value":"PI:Analogue"}, "id":1}')
    xbmc.executeJSONRPC('{"jsonrpc":"2.0", "method":"Settings.SetSettingValue", "params":{"setting":"audiooutput.passthrough","value":false}, "id":1}')
    jsonSWAT_PlayerId = xbmc.executeJSONRPC('{"jsonrpc":"2.0","method":"Settings.GetSettingValue", "params":{"setting":"audiooutput.audiodevice"},"id":1}') 
    print jsonSWAT_PlayerId

jsonSWAT_PlayerId = xbmc.executeJSONRPC('{"jsonrpc":"2.0","method":"Settings.GetSettingValue", "params":{"setting":"audiooutput.audiodevice"},"id":1}') 
json_response = unicode(jsonSWAT_PlayerId, 'utf-8', errors='ignore')
data = simplejson.loads(json_response)
myAudio =  data['result']['value']
xbmcgui.Dialog().ok('Audio Change','Audio now using --> ' + myAudio)

    #for item in data['result']['value']:
    #    print item
