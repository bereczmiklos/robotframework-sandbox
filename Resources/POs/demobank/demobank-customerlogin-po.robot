*** Settings ***
Resource    C:\sandbox\test-automatization\robot-framework\robotframework-sandbox\Resources\interactions.robot
Resource    C:\sandbox\test-automatization\robot-framework\robotframework-sandbox\Resources\common.robot

*** Variables ***
${username_select}  //select[@id='userSelect']
${login_btn}        //button[@type='submit']

*** Keywords ***
Select username
    [Arguments]    ${username}
    UI Select Option By Label    ${username_select}  ${username}

Click login button
    UI Click Button    ${login_btn}

Login with username
    [Arguments]    ${username}
    Select Username    ${username}
    Click Button  ${login_btn}
    UI Page Should Contain    ${username}