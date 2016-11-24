import xbmc, xbmcgui 
currentWindow = xbmcgui.Window(xbmcgui.getCurrentWindowId())
print "currentWindow=" + str(currentWindow)
currentControlList = currentWindow.getFocusId()
print "currentControlList=" + str(currentControlList)

locstr1 =  xbmc.getInfoLabel("System.CurrentWindow")
locstr2=   xbmc.getInfo("Container(" + ControlGroup(8999).HasFocus() + ").ListItem.Property(defaultID)")
print locstr1
print locstr2
xbmc.executebuiltin('Notification('+ "locstr1=" + locstr1 + ' , ' + "locstr2=" + locstr2 + ' , 4000,/home/osmc/.kodi/addons/skin.picars/lcars/avi/yellow.gif)')
