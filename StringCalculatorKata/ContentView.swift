//
//  ContentView.swift
//  StringCalculatorKata
//
//  Created by Pratiksha on 05/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputString: String = ""
    @State private var resultString: String = "Result: 0"
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""

    private let calculator = StringCalculator() // Instantiate the calculator

    var body: some View {
        VStack(spacing: 20) {
            Text("String Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            TextField("Enter numbers (e.g., 1,2\\n3)", text: $inputString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .keyboardType(.numbersAndPunctuation)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            Button("Calculate Sum") {
                calculateSum()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text(resultString)
                .font(.title2)
                .foregroundColor(showError ? .red :.primary) // Change color to red if error
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .alert("Error", isPresented: $showError) {
            Button("OK") {
                showError = false
            }
        } message: {
            Text(errorMessage)
        }
    }

    private func calculateSum() {
        showError = false // Reset error state
        errorMessage = "" // Clear previous error message

        do {
            print("input string: ", inputString)
            let sum = try calculator.add(inputString)
            resultString = "Result: \(sum)"
        } catch let error as CalculatorError {
            showError = true
            errorMessage = error.description // Use the custom description from CalculatorError
            resultString = "Error: \(error.description)" // Display error in result area too
        } catch {
            showError = true
            errorMessage = "An unexpected error occurred: \(error.localizedDescription)"
            resultString = "Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}
