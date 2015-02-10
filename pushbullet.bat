REM - Sabnzbd PushBullet post-processing script for Windows
REM - Add your api key and the deviceid of the device to receive the notifcation below. Leave blank to send to all devices.

CLS

SET api=
SET deviceid=

SET status=%7
SET zero=0
SET filename=%3
SET filename=%filename: ="%

IF %status% EQU %zero% (GOTO :SUCCESS) ELSE (GOTO :FAIL)
:SUCCESS
SET title=Sabnzbd - Download Successfull
SET msg=Sabnzbd - Successfully downloaded %filename%
curl https://api.pushbullet.com/api/pushes -u "%api%": -d device_iden="%deviceid%" -d type=note -d title="%title%" -d body="%msg%" -X POST -k -s -S
EXIT
:FAIL
SET title=Sabnzbd - Download Failed
SET msg=Sabnzbd - Failed to download %filename%
curl https://api.pushbullet.com/api/pushes -u "%api%": -d device_iden="%deviceid%" -d type=note -d title="%title%" -d body="%msg%" -X POST -k -s -S
EXIT
