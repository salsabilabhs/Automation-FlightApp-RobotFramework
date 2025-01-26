*** Settings ***
Library    AppiumLibrary
Resource    ../PageObjects/FirstPage/firstPage.robot
Resource    ../PageObjects/LoginPage/loginPage.robot
Test Setup    Run Keywords    
...           Open BookFlight App
...           Verify First Page Appears
Test Teardown    Close BookFlight App

*** Test Cases ***
#Login with Valid Credentials
User successfully Login with Valid Credentials
    User Login with Valid Credentials

#Login with Invalid Credentials
User Unsuccessfully Login with Invalid Credentials
    Click Menu Sign In
    Verify Login Page Appears
    Input Invalid Username
    Input Invalid Password
    Click Sign In
    Validate Login Error Message Appears
