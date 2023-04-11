*** Settings ***
Resource    C:\sandbox\test-automatization\robot-framework\robotframework-sandbox\Resources\interactions.robot
Resource    C:\sandbox\test-automatization\robot-framework\robotframework-sandbox\Resources\common.robot
Library     Collections

*** Variables ***


*** Keywords ***
List books
    @{rows}=  Get Webelements    //tbody/tr

    FOR  ${row}  IN  @{rows}
        @{row_data}=  Create List
        LOglist  @{row_data}
        @{cells}=  Get Webelements    ${row}/td
        FOR  ${cell}  IN  @{cells}
            ${text}=  Get Text    ${cell}
            Append To List    ${row_data}  ${text}
            Append To List    ${row_data}  -
        END
        Loglist    @{row_data}
    END

Loglist
    [Arguments]    @{list}
    Log To Console    |@{list}