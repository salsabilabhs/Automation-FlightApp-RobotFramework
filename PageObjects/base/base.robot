*** Settings ***
Library    AppiumLibrary

*** Variables ***
${remote_url}            http://127.0.0.1:4723/wd/hub 
${platform_name}         Android
${platform_version}      14.0
${device_name}           RRCT201J1HH
${app_package}           com.example.myapplication
${app_activity}           com.example.myapplication.MainActivity

*** Keywords ***
Open BookFlight App        
    Open Application    remote_url=${remote_url}
  ...    platformName=${platform_name}
  ...    platformVersion=${platform_version}
  ...    deviceName=${device_name}
  ...    appPackage=${app_package}
  ...    appActivity=${app_activity} 

Close BookFlight App
    Close Application