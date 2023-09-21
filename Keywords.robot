*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${url}    http://practice.automationtesting.in/
${brower}    chrome
${email}    tranxthien22223380@gmail.com
${password}    Thien123@Thien123
${My account}    https://practice.automationtesting.in/my-account/

*** Keywords ***
# Chung #
Open website
    Open Browser    ${url}    ${brower}

Navigate to the "My account" page 
    Click Element    xpath://a[@href="https://practice.automationtesting.in/my-account/"]

Navigate to the "Shop" page 
    Click Element    xpath://*[@id="menu-item-40"]/a

Navigate to the "Items" menu to see the product has been added to the basket
    Click Element    xpath://a[@href="https://practice.automationtesting.in/basket/"]
# Register #
Input username and password
    [Arguments]    ${email}    ${password}
    Wait For Condition  	return document.readyState == "complete"
    Input Text    id:reg_email    ${email}
    Input Text    id:reg_password    ${password}
    Press Keys    id:reg_password    ESC   
    Sleep    3s     

Fill out the information and click the register button
    #Wait Until Element Is Enabled     //input[@name="register"]     timeout=25s
    Click Element    //input[@name="register"]
    Sleep    3s

User account registration successful
    Wait Until Page Contains Element    //*[@id="content"]
    Page Should Contain Element    //*[@id="page-36"]/div/div[1]/div

Invalid email registration failed
    ${validationText}    Get Element Attribute    //input[@id='reg_email']    validationMessage
    Log    ${validationText}
    Should Be Equal As Strings    ${validationText}    Please include an '@' in the email address. 'tranx2222gmail.com' is missing an '@'.
    Sleep    10s

Registration failed when email is blank and shows error message   
    Page Should Contain     Error: Please provide a valid email address.
    Sleep    10s

Registration fails when password is blank and shows error message
    Wait Until Page Contains Element    xpath://ul[@class="woocommerce-error"]    timeout=20s
    Page Should Contain Element    xpath://ul[@class="woocommerce-error"]
    Sleep    10s
Registration failed when empty email, password blank and showing error message
    Page Should Contain    Error: Please provide a valid email address. 
    Sleep    10s


# Login #
Username and password login
    [Arguments]    ${email}    ${password}
    Input Text    id:username    ${email}
    Input Text    id:password    ${password}   

After filling in the information click the login button
    Click Button    xpath://input[@name="login"]

Successful login with correct email and password
    Wait Until Page Contains    Hello tranxthien2222 (not tranxthien2222? Sign out)
    Page Should Contain    Hello tranxthien2222 (not tranxthien2222? Sign out)

Login failed when entering wrong email and password
    Wait Until Page Contains     A user could not be found with this email address.
    Page Should Contain    A user could not be found with this email address.

Login failed when password is blank
    Wait Until Page Contains     Error: Password is required.
    Page Should Contain    Error: Password is required.

Login failed when username is blank
    Wait Until Page Contains     Error: Username is required.
    Page Should Contain    Error: Username is required.
    Sleep    5s

Login failed when username and password are blanks
    Wait Until Page Contains     Error: Username is required.
    Page Should Contain    Error: Username is required.

Password has been masked
    Execute Javascript    document.getElementById('password').type = 'password'
# Execute Javascript document.getElementById('password').type = 'password': thực thi mã JavaScript để thay đổi kiểu trường nhập liệu mật khẩu thành "password". 
# ẩn mật khẩu bằng các dấu sao hoặc chấm trên trình duyệt.

Login failed when password is capitalized
    Wait Until Page Contains    Error: The password you entered for the username tranxthien2222@gmail.com is incorrect. Lost your password?
    Page Should Contain    Error: The password you entered for the username tranxthien2222@gmail.com is incorrect. Lost your password?


# Home #
Navigate from shop page to home page
    Click Element    xpath://*[@id="menu-item-40"]/a
    Click Element    xpath://*[@id="content"]/nav/a

The Home page must contains only three sliders
    ${slider_count}    Get WebElements    xpath://*[@class="n2-ss-slider-3"]//img    
    Length Should Be    ${slider_count}    3
    Sleep    5s

The Home page must contains only three Arrivals
    ${arrivals_count}    Get WebElements    xpath://ul[@class='products']
    Length Should Be    ${arrivals_count}    3
    Sleep    5s

Click Random Arrival Image
    ${images} =    Get WebElements    xpath=//ul[@class='products']/li//img
    ${random_index} =    Evaluate    random.randint(1, len($images)-1)
    #${random_index} =    Pyint    min_value=1    max_value=len($images)    step=1
    Click Element    ${images[${random_index}]}
    Sleep    5s
# Evaluate: thực thi các biểu thức Python trong lệnh Robot Framework.
# random.randint(0, len($elements)-1): biểu thức Python. random.randint(a, b) sẽ tạo một số nguyên ngẫu nhiên 
# trong khoảng từ a đến b (bao gồm cả a và b).
# ${random_index}: Đây là biến của Robot Framework để lưu giá trị của biểu thức Python. Sau khi lệnh thực hiện, 
# random_index sẽ giữ giá trị số nguyên ngẫu nhiên.
# Click Element ${elements[${random_index}]}
# Click Element: Đây là keyword của thư viện SeleniumLibrary để thực hiện việc nhấn vào một phần tử trên trang web.
# ${elements[${random_index}]}: Đây là cách bạn truyền một phần tử từ danh sách ${elements} bằng cách sử dụng chỉ số ${random_index}. 
# Điều này sẽ làm cho Robot Framework nhấn vào phần tử ngẫu nhiên đã chọn.

Navigate to the details page of the success book
    Wait Until Page Contains Element    xpath://button[@class="single_add_to_cart_button button alt"]
    Page Should Contain Element    xpath://button[@class="single_add_to_cart_button button alt"]
    Sleep    5s

Click the Description tab to view the book's details
    Click Element    xpath://li[@class="description_tab active"]

Successful display of book information
    Wait Until Page Contains Element    xpath://a[@href="#tab-description"]
    Page Should Contain Element    xpath://a[@href="#tab-description"]
    Sleep    10s

Click on the Reviews tab to view the book's details
    Click Element    xpath://li[@class="reviews_tab"]

Successful display of book reviews
    Wait Until Page Contains Element    xpath://a[@href="#tab-reviews"]
    Page Should Contain Element    xpath://a[@href="#tab-reviews"]

Enter product quantity
    Input Text    xpath://input[@name='quantity']    21

Enter product quantity equal to 0
    Input Text    xpath://input[@name='quantity']    0

Click Add to basket
    Wait Until Element Is Enabled     xpath://button[@class="single_add_to_cart_button button alt"]     timeout=20s
    Click Element    xpath://button[@class="single_add_to_cart_button button alt"]
    Sleep    3s

Successfully added product to basket
    Wait Until Page Contains     21 × “Selenium Ruby” have been added to your basket.
    Page Should Contain     21 × “Selenium Ruby” have been added to your basket.

Add product fails and shows error message
    ${validation_Text}    Get Element Attribute    //input[@name='quantity']    validationMessage
    Log    ${validation_Text}
    Should Be Equal As Strings    ${validation_Text}    Value must be greater than or equal to 1.
    Sleep    10s


# Items #
Click Random product
    ${products}    Get WebElements    xpath://ul[@class='products masonry-done']/li//img
    ${product_index} =    Evaluate    random.randint(0, len($products)-1)
    Click Element    ${products[${product_index}]}
    Sleep    5s

Click the "x" to remove the product from the basket
    Click Element    xpath://td[@class="product-remove"]

Display message successfully removed product from basket
    Page Should Contain Element    xpath://*[@id="page-34"]/div/div[1]/div[1]

Click the "undo" button to restore the deleted product
    Click Element    xpath://*[@id="page-34"]/div/div[1]
    Sleep    5s

Product has been restored successfully
    Wait Until Page Contains Element    //*[@id="layout"]        
    Page Should Contain Element    //*[@id="layout"]       
    Sleep    5s

Enter product quantity in Items menu
    Input Text    xpath://*[@id="page-34"]/div/div[1]/form/table/tbody/tr[1]/td[5]/div/input    10

Enter "update basket" to update the quantity you just filled in
    Click Element    xpath://*[@id="page-34"]/div/div[1]/form/table/tbody/tr[2]/td/input[1]
    Sleep    5s

The product has been successfully updated
    Wait Until Page Contains    Basket updated.
    Page Should Contain    Basket updated.

Show empty cart when update quantity equal to 0
    Wait Until Page Contains    Your basket is currently empty.
    Page Should Contain    Your basket is currently empty.
Enter product quantity in Items menu (0)
    Input Text    xpath://*[@id="page-34"]/div/div[1]/form/table/tbody/tr[1]/td[5]/div/input    0

Add book to basket
    Click Element    xpath://a[@href="https://practice.automationtesting.in/product/selenium-ruby/"]
    Click Element    xpath://button[@class="single_add_to_cart_button button alt"]
    Wait Until Page Contains Element   xpath://*[@id="content"]/div[1]
    Page Should Contain Element    xpath://*[@id="content"]/div[1]

Input coupon code
    Input Text    xpath://*[@id="coupon_code"]    krishnasakinala

Click the apply coupon button
    Click Element    xpath://*[@id="page-34"]/div/div[1]/form/table/tbody/tr[2]/td/div/input[2]

Successful discount when applying the code with books larger than 450srp
    Page Should Contain Element    xpath://*[@id="page-34"]/div/div[1]/div[1]
    Sleep    5s

Add books with price less than or equal to 450
    Click Element    xpath://a[@href="https://practice.automationtesting.in/product/functional-programming-in-js/"]
    Click Element    xpath://button[@class="single_add_to_cart_button button alt"]
    Wait Until Page Contains Element   xpath://*[@id="content"]/div[1]
    Page Should Contain Element    xpath://*[@id="content"]/div[1]

Discount failed when applying code with books larger than 450
    Wait Until Page Contains Element    xpath://*[@id="page-34"]/div/div[1]/ul
    Page Should Contain Element    xpath://*[@id="page-34"]/div/div[1]/ul
    Sleep    5s

Click apply coupon
    Click Element    xpath://*[@id="page-34"]/div/div[1]/form/table/tbody/tr[2]/td/div/input[2]

Applying discount code failed when the "coupon code" box was blank.
    Wait Until Page Contains Element    xpath://*[@id="page-34"]/div/div[1]/ul
    Page Should Contain Element    xpath://*[@id="page-34"]/div/div[1]/ul
    Sleep    5s

Block advertisement
    ${countAds}=     Get Element Count    //ins
    IF    '${countAds}' == '0'
        Log    fill data
    ELSE
        ${status}=     Get Element Attribute    //ins    aria-hidden
        IF    '${status}' == 'true'
            Log    fill data
        ELSE
            Reload Page
            Click Element    //*[@id="dismiss-button"]
        END
    END