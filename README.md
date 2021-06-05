# iOS_ToDoAppUITest

This code run for to-do app UI test. Following steps describes how to run it with simulator.
Before ready to test, instal Xcode and prepare your simulator device in Xcode to build the app and test. For my example, user iPhone 12 pro Max with iOS 14.4

1. Change directiry to any place you want to put the test file. And git clone to get ToDoListUITests.swift here.

>git clone git@github.com:beethoreven/iOS_ToDoAppUITest.git


2. Change directiry to any place you want to put the to do app project.

>git clone git@github.com:denyszelenchuk/ToDoList.git


3. Into the todo app project folder

>cd ToDoList


4. Copy the file `ToDoListUITests.swift` to replace `/ToDoList/ToDoListUITests/ToDoListUITests.swift`.

5. You may need to run `pod install` for the first time building the app. Also, `brew install xcbeautify` is an optional installation, which make the log be simple.

6. You can definitely use Xcode to run UI test. If so, you can even see how it run on simulator. If not, just use the following command to run it on console.

7. Run the UI test on sample device emulator (with or without xcbeautify).

>xcodebuild \
>  -workspace ToDoList.xcworkspace \
>  -scheme ToDoList \
>  -sdk iphonesimulator \
>  -destination 'platform=iOS Simulator,name=iPhone 12 pro Max,OS=14.4' \
>  test \
>  | xcbeautify

8, Test result will be like this.

![result](https://i.imgur.com/36hvcxF.png)
