*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

*** Keywords ***
MY open site
    [Arguments]    ${url}  ${waitfor}
    Go To    ${url}
    Wait Until Page Contains Element    ${waitfor}

MY open browser
    [Arguments]    ${browser}  ${url}  ${waitfor}
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${waitfor}

MY go back
    [Arguments]    ${waitfor}
    Go Back
    Wait Until Page Contains Element    ${waitfor}

MY setup
    [Arguments]    ${browser}  ${url}  ${waitfor}
    MY Open Browser    ${browser}  ${url}  ${waitfor}

MY teardown
    Close All Browsers

MY pause test
    Pause Execution     Test paused