# String Calculator – iOS TDD Kata

This project is a solution to the **String Calculator TDD Kata**, completed as part of the iOS Developer selection process at Incubyte.

It focuses on practicing **Test-Driven Development (TDD)** while building a simple calculator that processes strings and returns the sum of the numbers inside them. The project also includes a **basic iOS UI** to make the calculator interactive.

---

## 🧪 Features

* Handles an empty string, single numbers, and multiple comma-separated numbers
* Accepts new lines (`\n`) between numbers (e.g., `"1\n2,3"` → `6`)
* Supports custom delimiters (e.g., `"//;\n1;2"` → `3`)
* Throws an error for negative numbers with a message showing all negatives found
* Simple and clean iOS UI with:

  * A text field for input
  * A button to trigger the calculation
  * A label to display the result or error

---

## 🚀 How to Run

1. Clone the repo
2. Open the `.xcodeproj` file in Xcode
3. Run on Simulator or your iOS device

---

## ✅ TDD Approach

This project follows a strict TDD cycle:

1. **Red** – Write a failing test
2. **Green** – Make the test pass with minimal code
3. **Refactor** – Improve the design while keeping tests green

All major functionality is covered through unit tests using Swift Testing framework. You’ll find commits made incrementally after each test-driven change to reflect the development flow.

---

## 📱 UI Preview

The app provides a small, functional interface that accepts string input, processes it through the String Calculator, and displays the result or an error message if applicable.

---

## 🔧 Tools & Technologies

* **Swift**
* **Xcode**
* **SwiftUI**
* **Swift Testing**

---

## 🧩 What You Can Try

Try inputs like:

* `""` → `0`
* `"1"` → `1`
* `"1,2,3"` → `6`
* `"1\n2,3"` → `6`
* `"//;\n1;2"` → `3`
* `"1,-2,-4"` → throws error: `"Negative numbers not allowed: -2, -4"`

---

## 🙌 Thanks

Thank you to **Incubyte** for the opportunity to work on this assignment. It was fun to build something simple with a sharp focus on clean code, tests, and good design!
