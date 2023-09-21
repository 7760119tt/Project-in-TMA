*** Settings ***
Resource    ../Robot_BC_CK/Keywords.robot
*** Variables ***

*** Test Cases ***
# Register #
TC1 user account registration successful
    Open website
    Block advertisement
    Navigate to the "My account" page
    Input username and password    ${email}    ${password}
    Fill out the information and click the register button
    User account registration successful
TC2 registration failed 
    Open website
    Navigate to the "My account" page 
    Input username and password    email=tranx2222gmail.com    password=Thien@123Thien123
    Fill out the information and click the register button
    Invalid email registration failed
    Close Browser
TC3 empty email
    Open website
    Navigate to the "My account" page 
    Input username and password    ${EMPTY}    ${password}
    Fill out the information and click the register button
    Registration failed when email is blank and shows error message
    Close Browser
TC4 empty password
    Open website
    Navigate to the "My account" page 
    Input username and password    ${email}    ${EMPTY}
    Fill out the information and click the register button
    Registration fails when password is blank and shows error message
    Close Browser
TC5 empty password and email
    Open website
    Navigate to the "My account" page 
    Input username and password    ${EMPTY}    ${EMPTY}
    Fill out the information and click the register button
    Registration failed when empty email, password blank and showing error message
    Close Browser

# Login #
TC1 login success
    Open website
    Navigate to the "My account" page 
    Username and password login    ${email}    ${password}
    After filling in the information click the login button
    Successful login with correct email and password
    Close Browser
TC2 incorrect password and username
    Open website
    Navigate to the "My account" page 
    Username and password login    email=thie@gmail.com   password=Thienj@123ghid
    After filling in the information click the login button
    Login failed when entering wrong email and password
    Close Browser
TC3 empty password
    Open website
    Navigate to the "My account" page 
    Username and password login    ${email}   ${EMPTY}
    After filling in the information click the login button
    Login failed when password is blank
    Close Browser
TC4 empty username
    Open website
    Maximize Browser Window
    Navigate to the "My account" page 
    Username and password login    ${EMPTY}   ${password}
    After filling in the information click the login button
    Login failed when username is blank
    Close Browser
TC5 empty password and username
    Open website
    Navigate to the "My account" page 
    Username and password login    ${EMPTY}   ${EMPTY}
    After filling in the information click the login button
    Login failed when username and password are blanks
    Close Browser
TC6 mask password
    Open website
    Navigate to the "My account" page 
    Username and password login    ${email}    ${password}
    Password has been masked 
    Close Browser    
TC7 handles case sensitive
    Open website
    Maximize Browser Window
    Navigate to the "My account" page 
    Username and password login    ${email}    ${password.upper()}
    After filling in the information click the login button
    Login failed when password is capitalized   
    Close Browser

# Home page #
TC1 home page has 3 sliders
    Open website
    Navigate from shop page to home page
    The Home page must contains only three sliders
    Close Browser
TC2 three arrvivals
    Open website
    Navigate from shop page to home page
    The Home page must contains only three Arrivals
    Close Browser
TC3 add products to basket
    Open website
    Navigate from shop page to home page
    The Home page must contains only three Arrivals
    Click Random Arrival Image
    Navigate to the details page of the success book
    Close Browser
TC4 show description page
    Open website
    Navigate from shop page to home page
    The Home page must contains only three Arrivals
    Click Random Arrival Image
    Navigate to the details page of the success book
    Click the Description tab to view the book's details
    Successful display of book information
    Close Browser
TC5 show reviews page
    Open website
    Navigate from shop page to home page
    The Home page must contains only three Arrivals
    Click Random Arrival Image
    Navigate to the details page of the success book
    Click on the Reviews tab to view the book's details
    Successful display of book reviews
    Close Browser
TC6 add products
    Open website
    Navigate from shop page to home page
    The Home page must contains only three Arrivals
    Click Random Arrival Image
    Navigate to the details page of the success book
    Enter product quantity
    Click Add to basket
    Successfully added product to basket
    Close Browser
TC7 add products with quantity equal to 0
    Open website
    Navigate from shop page to home page
    The Home page must contains only three Arrivals
    Click Random Arrival Image
    Navigate to the details page of the success book
    Enter product quantity equal to 0
    Click Add to basket
    Add product fails and shows error message
    Close Browser

# Items #
TC1 Remove product from basket
    Open website
    Navigate to the "Shop" page
    Click Random product
    Click Add to basket
    Navigate to the "Items" menu to see the product has been added to the basket
    Click the "x" to remove the product from the basket
    Display message successfully removed product from basket
TC2 restoring deleted products
    Open website
    Navigate to the "Shop" page
    Click Random product
    Click Add to basket
    Navigate to the "Items" menu to see the product has been added to the basket
    Click the "x" to remove the product from the basket
    Display message successfully removed product from basket
    Click the "undo" button to restore the deleted product
    Product has been restored successfully
    Close Browser
TC3 update basket
    Open website
    Navigate to the "Shop" page
    Click Random product
    Click Add to basket
    Navigate to the "Items" menu to see the product has been added to the basket
    Enter product quantity in Items menu
    Enter "update basket" to update the quantity you just filled in
    The product has been successfully updated
    Close Browser
TC4 product quantity is 0
    Open website
    Navigate to the "Shop" page
    Click Random product
    Click Add to basket
    Navigate to the "Items" menu to see the product has been added to the basket
    Enter product quantity in Items menu (0)
    Enter "update basket" to update the quantity you just filled in
    Show empty cart when update quantity equal to 0
    Close Browser
TC5 discount code greater than 450
    Open website
    Navigate to the "Shop" page
    Add book to basket
    Navigate to the "Items" menu to see the product has been added to the basket
    Input coupon code
    Click the apply coupon button
    Successful discount when applying the code with books larger than 450srp
    Close Browser
TC6 discount code less than or equal to 450
    Open website
    Navigate to the "Shop" page
    Add books with price less than or equal to 450
    Navigate to the "Items" menu to see the product has been added to the basket
    Input coupon code
    Click the apply coupon button
    Discount failed when applying code with books larger than 450
    Close Browser
TC7 blank coupon code
    Open website
    Navigate to the "Shop" page
    Click Random product
    Click Add to basket
    Navigate to the "Items" menu to see the product has been added to the basket
    Click the apply coupon button
    Applying discount code failed when the "coupon code" box was blank.
    Close Browser

