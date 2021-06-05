//
//  ToDoListUITests.swift
//  ToDoListUITests
//

import XCTest

class ToDoListUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test01_Welcome() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        //Wait for UI ready
        sleep(2)

        // First launch check
        if app.staticTexts["Welcome to ToDoList"].waitForExistence(timeout: 5) {
            app.buttons["Continue"].tap()
            app.buttons["Not now"].tap()
            app.buttons["Get started"].tap()
        }
    }
    
    func test02_AddTask() throws {
        let app = XCUIApplication()
        app.launch()
        //Wait for UI ready
        sleep(2)

        if app.buttons["Add Task"].waitForExistence(timeout: 3) {
            app.buttons["Add Task"].tap()
        }

        // There is an issue here. When app just opened, the button failed sometime. Can reproduce by manually test. So, add retry once here.
        if !app.textViews["EditTaskViewController.taskTitleTextView"].exists {
            print("Retry Add Task")
            app.buttons["Add Task"].tap()
        }
        app.typeText("Arthur Test")
            
        app.buttons["Save"].tap()
        
        // Check if add success
        app.staticTexts["All Tasks"].tap()
        
        XCTAssert(app.staticTexts["Arthur Test"].exists, "Test To Do item is not created")
    }
    
    func test03_EditTask() throws {
        let app = XCUIApplication()
        app.launch()
        //Wait for UI ready
        sleep(2)

        if app.staticTexts["All Tasks"].waitForExistence(timeout: 3) {
            app.staticTexts["All Tasks"].tap()
        }
        // There is an issue here. When app just opened, the button failed sometime. Can reproduce by manually test. So, add retry once here.
        if !app.navigationBars["All Tasks"].waitForExistence(timeout: 3) {
            print("Retry All tasks")
            app.staticTexts["All tasks"].tap()
        }

        app.staticTexts["Arthur Test"].tap()
        
        app.buttons["Edit"].tap()
        
        let textField = app.textViews["EditTaskViewController.taskTitleTextView"]
        let textFieldContent = textField.value as! String

        //Repeat deleta key with the string length to perform clear all content
        textField.typeText( String(
                            repeating: XCUIKeyboardKey.delete.rawValue,
                            count: textFieldContent.count) )

        textField.typeText("Arthur Test Edit")
        
        app.buttons["Save"].tap()

        XCTAssert(app.staticTexts["Arthur Test Edit"].exists, "Test To Do item is not edited")
    }

    func test04_DeleteTask() throws {
        let app = XCUIApplication()
        app.launch()
        //Wait for UI ready
        sleep(2)
        
        
        if app.staticTexts["All Tasks"].waitForExistence(timeout: 3) {
            app.staticTexts["All Tasks"].tap()
        }
        // There is an issue here. When app just opened, the button failed sometime. Can reproduce by manually test. So, add retry once here.
        if !app.navigationBars["All Tasks"].waitForExistence(timeout: 3) {
            print("Retry All tasks")
            app.staticTexts["All tasks"].tap()
        }
        
        app.staticTexts["Arthur Test Edit"].swipeLeft()
        
        app.buttons["Delete"].tap()
        
        XCTAssert(!app.staticTexts["Arthur Test Edit"].exists, "Test To Do item is not deleted")
    }
}
