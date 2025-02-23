//
//  CalculatorButtons.swift
//  Calculator
//
//  Created by Abhih  Kodavanty on 2/22/25.
//

import SwiftUI

struct NumberButton: View {
    let number: Int
    @ObservedObject var calculator: CalculatorModel
    
    var body: some View {
        Button(action: {
            calculator.addNumber(number)
        }) {
            Text("\(number)")
                .font(.title)
                .frame(width: 75, height: 75)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}

struct OperatorButton: View {
    let symbol: String
    @ObservedObject var calculator: CalculatorModel
    
    var body: some View {
        Button(action: {
            calculator.addOperator(symbol)
        }) {
            Text(symbol)
                .font(.title)
                .frame(width: 75, height: 75)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}

struct ClearButton: View {
    @ObservedObject var calculator: CalculatorModel
    
    var body: some View {
        Button(action: {
            calculator.clear()
        }) {
            Text("AC")
                .font(.title)
                .frame(width: 75, height: 75)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}

struct EqualButton: View {
    @ObservedObject var calculator: CalculatorModel
    
    var body: some View {
        Button(action: {
            calculator.calculateResult()
        }) {
            Text("=")
                .font(.title)
                .frame(width: 75, height: 75)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}
