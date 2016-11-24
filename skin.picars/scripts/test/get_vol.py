#!/usr/bin/env python
import xbmc
myComm = '{"jsonrpc": "2.0", "method": "Application.GetProperties", "params": {"properties": ["volume"]}, "id": 1}'
xbmc.executeJSONRPC( myComm )
