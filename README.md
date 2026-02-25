# Flash check

🚀 FLASH CHECK

A Flutter Based Typing Speed Tracker App.
FLASH CHECK is a simple and interactive typing speed tester built using Flutter.
It allows users to test their typing speed, calculate accuracy, and track their best WPM.


📱 Features

✅ Difficulty Levels (Easy / Medium / Hard)

✅ Countdown Timer Based Test

✅ Automatic WPM Calculation

✅ Accuracy Percentage Calculation

✅ Best WPM Tracking

✅ Result Dialog After Test Completion

✅ Clean and Simple UI

✅ Proper Navigation Between Screens


🧠 How It Works

User selects a difficulty level.

Timer starts automatically when test begins.

User types the given paragraph.

When timer ends:

WPM is calculated.

Accuracy is calculated.

Results are shown in a dialog.

WPM and Accuracy are sent back to Home screen.

Best WPM updates if new score is higher.


🧮 Calculation Logic

WPM Calculation

WPM is calculated based on the number of correctly typed words.


WPM = Number of Correct Words
Accuracy Calculation


Accuracy = (Correct Words / Total Typed Words) × 100


🗂 Project Structure


lib/
│
├── main.dart
├── home.dart
└── type.dart


🛠 Technologies Used

Flutter

Dart

Material Design

Navigator (for screen transition)

Timer class


▶ How To Run

Install Flutter SDK

Clone the project

Run:

flutter pub get

flutter run


🎯 Future Improvements

Save history of tests

Store Best WPM permanently using 
Shared Preferences

Add animations

Add live WPM counter

Add Dark Mode

Add Progress Graph


👨‍💻 Developed For Learning Purpose

This project demonstrates:

Stateful Widgets

Timer usage

TextEditingController

Navigator with data return

UI design basics

Result calculation logic


📌 Author

Ajith P A




