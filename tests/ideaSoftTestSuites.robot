*** Settings ***
Library    Selenium2Library
Resource     ../Variables/variables.robot
Resource     ../Variables/mainFunctions.robot
Resource     ../facilites/ideaSoftFacilites.robot

Suite Setup
Suite Teardown    Close All Browsers
Test Setup       Launch Browser
Test Teardown    When Test Fail Take Screenshot

*** Test Cases ***
1.Control of the number of items in the basket
    Searching for Products with the Search Bar
    Product Selected
    Go to Product Detail and Create Order
    Open Cart Page

