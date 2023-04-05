*** Settings ***
Resource    /Resources/interactions.robot
Resource    /Resources/common.robot

*** Variables ***
${addcustomer_btn}      //button[@ng-click='addCust()']
${openaccount_btn}      //button[@ng-click='openAccount()']
${customers_btn}      //button[@ng-click='showCust()']

*** Keywords ***
Add customer
    [Arguments]    ${first_name}  ${last_name}  ${post_code}
    UI Click Button    ${addcustomer_btn}

Open account
    UI Click Button    ${openaccount_btn}

List customers
    UI Click Button    ${customers_btn}