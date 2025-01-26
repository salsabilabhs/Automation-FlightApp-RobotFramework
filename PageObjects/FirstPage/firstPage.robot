*** Settings ***
Resource    ../base/base.robot
Variables    objectsFirstPage.yaml

*** Keywords ***
# Verify First Page Appears
Verify First Page Appears 
    Wait Until Element Is Visible    ${nextgendigital_logo}

# Verify User Successfully Logged In
Verify User Successfully Logged In    
    Wait Until Element Is Visible    ${nextgen_text}