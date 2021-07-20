*** Settings ***
Documentation   This is a basic test for testing authentication in a website
Library  SeleniumLibrary
Test Setup  Open Browser    ${URL}  ${browser}
Test Teardown   Close Browser

*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/
${browser}  Chrome
${headlessbrowser}  headlesschrome


*** Test Cases ***
LoginTest With Valid Credentials
    # [Setup]     Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Enter Username
    Input Text  name:txtPassword  admin123
    Click Login Button
    ${Current}  Get Location
    Log to Console  ${Current}
    Should Contain  ${Current}  dashboard
    Logout
    # [Teardown]  Close Browser

LoginTest With Invalid Credentials
    Maximize Browser Window
    Enter Username
    Input Text  name:txtPassword  wrong 
    Click Login Button
    # ${Current}  Get Location
    # Log to Console  ${Current}
    # Should Contain  ${Current}  validateCredentials
    Sleep   1s
    Page Should Contain     Invalid credentials
    Sleep   2s

*** Keywords ***
Enter Username
    Input Text  id:txtUsername  admin

Click Login Button
    Click Button    xpath://input[@value='LOGIN']

Logout
    Click Link    partial link:Welcome
    Sleep   2s           
    Click Link    link:Logout

#Open Webdriver hosted on Azure Devops
Create Webdriver    Chrome    executable_path=D:/a/1/s/node_modules/chromedriver/lib/chromedriver/chromedriver.exe