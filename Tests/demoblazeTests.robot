*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/interactions.robot
Test Setup     MY setup  ${BROWSER}  ${URL}  ${WAITFOR}
Test Teardown  MY teardown

*** Variables ***
${BROWSER}  chrome
${URL}      https://www.demoblaze.com/#
${WAITFOR}  //a[@id='nava']

*** Test Cases ***
Order phone
    UI click element  //div[@class='list-group']/a[2]
    UI Wait Until Page Contains  Samsung galaxy s6
    UI Click Element    //*[@id="tbodyid"]/div[1]/div/div/h4/a
    UI Wait Until Page Contains    Samsung galaxy s6
    UI Click Element    //*[@id="tbodyid"]/div[2]/div/a
    UI Alert Should Be Present    Product added

