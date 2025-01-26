*** Settings ***
Resource    ../base/base.robot
Variables    objectsSearchPage.yaml

*** Variables ***
${valid_flightnum}    DA935
${invalid_flightnum}    CA123

*** Keywords ***
# Click Search Menu
Click Search Menu
    Click Element    ${search_menu}

# Validate Search Page Appears
Validate Search Page Appears
    Wait Until Element Is Visible    ${enterflightnumber_text}

# Input Valid Flight Number
Input Valid Flight Number
    Input Text    ${search_field}    ${valid_flightnum}

# Click Search Button
Click Search Button
    Click Element    ${search_btn}

# Validate Result Appears
Validate Result Appears
    Wait Until Element Is Visible    ${result}

# Validate The Result Flight Number
Validate The Result Flight Number
    ${actual_flightnum}=    Get Text    ${result_flightnum}
    RETURN    ${actual_flightnum}

# Input Invalid Flight Number
Input Invalid Flight Number
    Input Text    ${search_field}    ${invalid_flightnum}

# Get Search Error Message
Validate Error Message Appears
    Wait Until Page Contains    Please enter valid Flight Number

# Validate Page Don't Show The Result
Validate Page Not Show The Result
    Page Should Not Contain Element    ${result}