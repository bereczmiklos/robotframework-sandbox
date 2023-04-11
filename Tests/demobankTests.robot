*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/POs/demobank/demobank-customerlogin-po.robot
Resource    ../Resources/POs/demobank/demobank-managerlogin-po.robot
Resource    ../Resources/POs/demobank/demobank-login-po.robot
Resource    ../Resources/POs/demobank/demobank-home-po.robot
Test Setup     MY setup  ${BROWSER}  ${URL}  ${WAITFOR}
Test Teardown  MY teardown

*** Variables ***
${BROWSER}  chrome
${URL}      https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login
${WAITFOR}  //strong

*** Test Cases ***
Login with customer test
    ${username}=  Set Variable  Hermoine Granger
    Login With Customer     ${username}

Login with manager
    Login With Manager

