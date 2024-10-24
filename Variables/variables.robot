*** Variables ***
${ideaSoftUrl}      https://testcase.myideasoft.com/
${searchBar}        xpath=//input[@aria-label='Search']
${searchButton}     //header/div[1]/div[1]/div[1]/div[2]/div[1]/form[1]/button[1]/*[1]
${product}          //a[contains(text(),'Kalemlik')]
${productQuantity}     //select[@id='qty-input']
${addToCartButton}     xpath=//a[@class='add-to-cart-button']
${addedToYourCartMessage}    //body/div[6]/div[1]
${cartPage}    //span[contains(text(),'Sepet')]
${checkCartPageProductQuantity}     //input[@value='5']