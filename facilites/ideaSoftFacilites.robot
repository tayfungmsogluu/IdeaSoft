*** Settings ***
Library   Selenium2Library
Resource  ../Variables/variables.robot
Resource  ../Variables/mainFunctions.robot

*** Keywords ***
Searching for Products with the Search Bar
    [Arguments]   ${productName}=Kalemlik
    Wait And Send Text   ${searchBar}   ${productName}
    Click Search Button
Product Selected
    Wait and Click Element    ${product}
Go to Product Detail and Create Order
    Select From List By Index    ${productQuantity}   4
    Sleep  1s
    Wait and Click Element    ${addToCartButton} 
    Check Element Text    ${addedToYourCartMessage}    SEPETİNİZE EKLENMİŞTİR   Adding the product to the cart was.
Open Cart Page
    Sleep  2s
    Wait And Click Element  ${cartPage}
    Sleep  1s
    Check Element Text    ${product}    Kalemlik    Checking items in the cart
    Check Input Text    ${checkCartPageProductQuantity}    5     The number of items in your cart has been verified.