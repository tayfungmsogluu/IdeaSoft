*** Settings ***
Resource     ../Variables/variables.robot
Library      Selenium2Library



*** Keywords ***

Wait For Element
    [Documentation]
    ...  This method waits for the item in the page source loaded
    ...  P.S : This method doesn't expect to visible.
    ...  Timeout variable is waiting time. Can change with this variable
    ...  Interval variable is recheck interval.

    [Arguments]    ${element}    ${timeout}=45 sec    ${interval}=0.5 sec
    Wait Until Keyword Succeeds    ${timeout}    ${interval}    Page Should Contain Element    ${element}
    Capture Page Screenshot

Wait And Click Element
    [Documentation]
    ...  This method is using for element click action.
    ...  Timeout variable is waiting time. Can change with this variable.
    ...  Interval variable is recheck interval.
    ...  P.S : If element isn't visible. This method should fail.

    [Arguments]    ${element}    ${timeout}=15 sec    ${interval}=1 sec
    wait for element    ${element}    ${timeout}    ${interval}
    Click Element     ${element}


Wait And Send Text
    [Documentation]
    ...  This method is using for filling text inputs and areas
    [Arguments]    ${element}    ${text}    ${timeout}=10 sec    ${interval}=1 sec
    wait for element    ${element}    ${timeout}    ${interval}
    Input Text    ${element}    ${text}

Click Search Button
    Wait And Click Element  ${searchButton}

Check Element Text
    [Documentation]
    ...  This method checks the text inside the element, if false, test case fails
    [Arguments]   ${element}  ${expectedText}  ${checkMessage}   ${timeout}=60s
    Capture Page Screenshot
    Wait For Element  ${element}  ${timeout}
    ${expectedText}=  convert to string  ${expectedText}
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Text Should Be    ${element}    ${expectedText}
    Run Keyword If    '${status}'=='PASS'    log to console    \n${checkMessage} Success
    ...    ELSE    Fail    \nERROR-${checkMessage}-ERROR
    Capture Page Screenshot

Check Input Text
    [Documentation]
    ...  This method checks the text inside the element, if false, test case fails
    [Arguments]   ${element}  ${expectedText}  ${checkMessage}   ${timeout}=60s
    Capture Page Screenshot
    Wait For Element  ${element}  ${timeout}
    ${expectedText}=  convert to string  ${expectedText}
    ${status}    ${value}=    Run Keyword And Ignore Error    Textfield Value Should Be    ${element}    ${expectedText}
    Run Keyword If    '${status}'=='PASS'    log to console    \n${checkMessage} Success
    ...    ELSE    Fail    \nERROR-${checkMessage}-ERROR
    Capture Page Screenshot

Launch Browser
    Open Browser    auto:blank   chrome
    Maximize Browser Window
    Go To     ${ideaSoftUrl}

When Test Fail Take Screenshot
    [Documentation]
    ...  This method takes a screenshot and closes the browser if the test case fail
    Run Keyword If Test Failed    Capture Page Screenshot
    Run Keyword If Test Failed    Close Browser
    Run Keyword If Test Passed    Close Browser



