*** Settings ***
Library    AppiumLibrary
Resource    ../PageObjects/LoginPage/loginPage.robot
Resource    ../PageObjects/SearchPage/searchPage.robot
Test Setup    Run Keywords
...           Open BookFlight App    
...           User Login with Valid Credentials
Test Teardown    Close BookFlight App       

*** Variables ***
${expected_flightnum}    DA 935

*** Test Cases ***
User Search by Valid Flight Number
    Click Search Menu
    Validate Search Page Appears
    Input Valid Flight Number
    Click Search Button
    Validate Result Appears
    ${actual_flightnum}=    Validate The Result Flight Number
    Should Be Equal    ${actual_flightnum}    ${expected_flightnum}

User Search by Invalid Flight Number
    Click Search Menu
    Validate Search Page Appears
    Input Invalid Flight Number
    Click Search Button
    Validate Error Message Appears
    Validate Page Not Show The Result