*** Settings ***
Resource    ../Resources/interactions.robot

*** Variables ***
${first_name_input}             //input[@id='firstName']
${last_name_input}              //input[@id='lastName']
${email_input}                  //input[@id='userEmail']
${mobile_input}                 //input[@id='userNumber']
${dob_input}                    //input[@id='dateOfBirthInput']
${current_address_textarea}     //textarea[@id='currentAddress']
${gender_male_radio}            //input[@id='gender-radio-1']
${gender_female_radio}          //input[@id='gender-radio-2']
${gender_other_radio}           //input[@id='gender-radio-3']

*** Keywords ***
Create student
    [Arguments]    ${first_name}  ${last_name}  ${email}  ${mobile}  ${dob}  ${current_address}  ${gender}
    UI Type Text    ${first_name_input}  ${first_name}
    UI Type Text    ${last_name_input}  ${last_name}
    UI Type Text    ${email_input}  ${email}
    UI Type Text    ${mobile_input}  ${mobile}
    UI Type Text    ${dob_input}  ${dob}
    UI Type Text    ${current_address_textarea}  ${current_address}
    Private Select Gender    ${gender}

Private select gender
    [Arguments]    ${gender}

    IF  '${gender}'  ==  'male'
        UI Click Element    ${gender_male_radio}
    ELSE IF    '${gender}'  ==  'female'
        UI Click Element    ${gender_female_radio}
    ELSE
        UI Click Element    ${gender_other_radio}
    END