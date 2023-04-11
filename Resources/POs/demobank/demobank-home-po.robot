*** Settings ***
Resource    C:\sandbox\test-automatization\robot-framework\robotframework-sandbox\Resources\interactions.robot
Resource    C:\sandbox\test-automatization\robot-framework\robotframework-sandbox\Resources\common.robot

*** Variables ***
${tranzactions_btn}         //button[@ng-click='transactions()']
${deposit_btn}              //button[@ng-click='deposit()']
${withdrawl_btn}            //button[@ng-click='withdrawl()']
${logout_btn}               //button[@ng-click='byebye()']
${reset_transaction_btn}    //button[@ng-click='reset()']
${back_btn}                 //button[@ng-click='back()']
${account_select}           //select[@id='accountSelect']
${submit_btn}               //button[@type='submit']
${amount_input}             //input[@type='number']
${balance_span}             //strong[@class='ng-binding'][2]

*** Keywords ***
List tranzactions

Make deposit
    [Arguments]    ${amount}
    UI Click Button    ${deposit_btn}
    UI Type Text    ${amount_input}  ${amount}
    UI Click Button    ${submit_btn}
    UI Page Should Contain    Deposit Successful

Make withdrawl
    [Arguments]    ${amount}
    UI Click Button    ${withdrawl_btn}
    UI Type Text    ${amount_input}  ${amount}
    UI Click Button    ${submit_btn}
    #UI Page Should Contain    Transaction successful

Logout
    UI Click Button    ${logout_btn}

Select account
    [Arguments]    ${account_number}
    UI Select Option By Label    ${account_select}  ${account_number}

Reset transactions
    UI Click Button    ${tranzactions_btn}
    UI Click Button    ${reset_transaction_btn}

Reset and do some transaction
    UI Click Button    ${tranzactions_btn}
    Reset Transactions
    UI Click Button    ${back_btn}
    Make Deposit    1000000
    Make Withdrawl    100
    Make Withdrawl    100
    Make Withdrawl    100

Check balance
    [Arguments]    ${expected}
    UI Wait Until Page Contains    Balance
    ${actual}=  Get Text    ${balance_span}
    #Should Be Equal   ${actual}   ${expected}