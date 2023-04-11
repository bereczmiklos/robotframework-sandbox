*** Settings ***
Resource    C:\sandbox\test-automatization\robot-framework\robotframework-sandbox\Resources\interactions.robot
Resource    C:\sandbox\test-automatization\robot-framework\robotframework-sandbox\Resources\common.robot
Resource    demobank-customerlogin-po.robot

*** Variables ***
${customer_login_btn}   //button[@ng-click='customer()']
${manager_login_btn}   //button[@ng-click='manager()']

*** Keywords ***
Login with customer
    [Arguments]    ${username}
    UI Click Button    ${customer_login_btn}
    UI Wait Until Page Contains    Your Name
    Login With Username    ${username}

Login with manager
    UI Click Button    ${manager_login_btn}
    UI Wait Until Page Contains    Add Customer