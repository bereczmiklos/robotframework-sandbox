*** Settings ***
Resource    ../Resources/POs/localhost/table-po.robot
Resource    ../Resources/common.robot
Test Setup     MY setup  ${BROWSER}  ${URL}  ${WAITFOR}
Test Teardown  MY teardown

*** Variables ***
${BROWSER}  chrome
${URL}      http://127.0.0.1:5500/index.html#
${WAITFOR}  //h1

*** Test Cases ***
List all row in table
    List Books