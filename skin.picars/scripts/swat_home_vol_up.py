#!/usr/bin/env python
import xbmc
import json
jsonSWAT_Sel_Vol = '{"jsonrpc": "2.0", "method": "Application.GetProperties", "params": {"properties": ["volume"]}, "id": 1}'
jsonSWAT_Notify = '{"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"Volume Level","message":"%s","image":"info"},"id":1}'
result = json.loads(xbmc.executeJSONRPC(jsonSWAT_Sel_Vol))['result']['volume']
print result
if result < 1:
    result = 12.5 
    print "Avoid 0 bug; set 0 vol. to 25"
new_vol = int((result * 2))
if new_vol  > 100:
    new_vol = 100
xbmc.executebuiltin("XBMC.SetVolume(%d)" %( new_vol, ) )
xbmc.executebuiltin("Notification(Completed...Vol. set to:," + str( new_vol, ) + " ,1500,/home/osmc/.kodi/addons/skin.picars/lcars/warn/green.gif)")
print "Exit pgm with Vol. set to: " 
print new_vol
