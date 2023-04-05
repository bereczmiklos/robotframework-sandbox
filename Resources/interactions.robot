*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
UI click button
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Button  ${locator}

UI double click element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Double Click Element   ${locator}

UI click element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Element  ${locator}

UI type text
    [Arguments]    ${locator}  ${text}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Clear Element Text    ${locator}
    Input Text    ${locator}  ${text}

UI type password
    [Arguments]    ${locator}  ${password}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Clear Element Text    ${locator}
    Input Text    ${password}

UI wait until page contains
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}

UI page should contain
    [Arguments]    ${text}
    Page Should Contain    ${text}

UI alert should be present
    [Arguments]    ${alert_text}
    Alert Should Be Present    ${alert_text}

UI scroll to view
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}

UI select option by label
    [Arguments]    ${locator}  ${label}
    Wait Until Element Is Visible    ${locator}
    Select From List By Label    ${locator}    ${label}