#!/usr/bin/env python
import xbmc
import json
jsonSWAT_Sel_Vol = '{"jsonrpc": "2.0", "method": "Application.GetProperties", "params": {"properties": ["volume"]}, "id": 1}'
jsonSWAT_Notify = '{"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"Volume Level","message":"%s","image":"info"},"id":1}'
result = json.loads(xbmc.executeJSONRPC(jsonSWAT_Sel_Vol))['result']['volume']
print result
xbmc.executeJSONRPC(jsonSWAT_Notify % result)


