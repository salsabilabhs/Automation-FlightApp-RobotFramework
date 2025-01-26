
*** Settings ***
Resource    ../base/base.robot
Resource    ../FirstPage/firstPage.robot
Variables    objectsLoginPage.yaml

*** Variables ***
${valid_email}    support@ngendigital.com
${valid_password}    abc123
${invalid_email}    support@digital.com
${invalid_password}    cde123

*** Keywords ***

# Click Menu Sign In
Click Menu Sign In 
    Click Element    ${signIn_menu}

# Verify Login Page Appears
Verify Login Page Appears 
    Wait Until Element Is Visible    ${username_field}

# Input Username
Input Invalid Username    
    Input Text    ${username_field}    ${invalid_email}

Input Valid Username 
    [Arguments]    ${email}
    Input Text    ${username_field}    ${email}

# Input Password
Input Invalid Password    
    Input Text    ${password_field}    ${invalid_password}

Input Valid Password   
    [Arguments]    ${password} 
    Input Text    ${password_field}    ${password}

# Click Sign In
Click Sign In    
    Click Element    ${signIn_btn}

# Validate Login with Valid Credentials Variables!
User Login with Valid Credentials
    [Arguments]    ${email}=${valid_email}    ${password}=${valid_password}
    Verify First Page Appears
    Click Menu Sign In
    Verify Login Page Appears
    Input Valid Username    ${email}
    Input Valid Password    ${password}
    Click Sign In
    Verify User Successfully Logged In

# Validate Error Message
Validate Login Error Message Appears
    Wait Until Page Contains    Invalid username/password