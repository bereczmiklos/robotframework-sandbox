*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/interactions.robot
Resource    ../POs/demoqa/demoqa-forms-po.robot
Test Setup     MY setup  ${BROWSER}  ${URL}  ${WAITFOR}
Test Teardown  MY teardown

*** Variables ***
${BROWSER}  chrome
${URL}      https://demoqa.com/
${WAITFOR}  //header/a

*** Test Cases ***
Buttons
    MY Open Site                   https://demoqa.com/buttons  //div[@class='main-header']
    UI Double Click Element        //button[@id='doubleClickBtn']
    UI Page Should Contain         You have done a double click
    UI Click Button                //button[@id='rightClickBtn']
    UI Page Should Contain         You have done a right click
    UI Click Button                //button[@id='xZL4X']
    UI Wait Until Page Contains    You have done a dynamic click

Select menu
    MY Open Site  https://demoqa.com/select-menu  //div[@class='main-header']

Get data from tables
    MY Open Site  https://demoqa.com/webtables  //div[@class='main-header']

    ${row_count}=  Get Element Count    //div[@class='rt-tr-group']
    FOR    ${index}    IN RANGE    1    11
        ${row}=  Set Variable    //div[@class='rt-tbody']/div[@class='rt-tr-group'][${index}]
        ${row_text}=  Get Text    ${row}
        Log    ${row_text}
    END

Create and delete data in table
    MY Open Site  https://demoqa.com/webtables  //div[@class='main-header']
    ${first_name}=  Set Variable    firstname
    ${last_name}=   Set Variable    lastname
    ${email}=       Set Variable    email@email.com
    ${age}=         Set Variable    18
    ${salary}=      Set Variable    180000
    ${department}=  Set Variable    QA

    UI Click Button    //button[@id='addNewRecordButton']
    UI Type Text    //input[@id='firstName']    ${first_name}
    UI Type Text    //input[@id='lastName']     ${last_name}
    UI Type Text    //input[@id='userEmail']    ${email}
    UI Type Text    //input[@id='age']          ${age}
    UI Type Text    //input[@id='salary']       ${salary}
    UI Type Text    //input[@id='department']   ${department}
    UI Click Button    //button[@id='submit']

    UI Page Should Contain    ${first_name}

    FOR    ${index}    IN RANGE    1    11
        ${first_cell}=  Set Variable    //div[@class='rt-tr-group'][${index}]/div/div[@class='rt-td'][1]
        ${first_cell_text}=  Get Text    ${first_cell}
        IF    '${first_cell_text}' == '${first_name}'
            ${row_id}=  Set Variable  ${index}
            Log To Console    ${index}
        END
    END

    ${delete_button}=  Set Variable    //div[@class='rt-tr-group'][${row_id}]/div/div/div/span[@title='Delete']
    UI Click Element    ${delete_button}

Create student with PO
    ${first_name}=       Set Variable    firstname
    ${last_name}=        Set Variable    lastname
    ${email}=            Set Variable    email@email.com
    ${gender}=           Set Variable    male
    ${mobile}=           Set Variable    1234567890
    ${dob}=              Set Variable    29 Mar 2023
    ${current_address}=  Set Variable    Robot street 66

    MY Open Site  https://demoqa.com/automation-practice-form  //div[@class='main-header']
    Create Student  ${first_name}  ${last_name}  ${email}  ${gender}  ${mobile}  ${dob}  ${current_address}
    MY Pause Test











