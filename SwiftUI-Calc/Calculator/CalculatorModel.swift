//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Abhih  Kodavanty on 2/22/25.
//

import Foundation

class CalculatorModel: ObservableObject {
    @Published var pressedNumbers: [String] = []
    
    func addNumber(_ number: Int) {
        pressedNumbers.append(String(number))
    }
    
    func addOperator(_ operation: String) {
        if !pressedNumbers.isEmpty, let lastIndex = pressedNumbers.last,
           lastIndex != " x " && lastIndex != " + " && lastIndex != " - " && lastIndex != " / " && lastIndex != "." {
            pressedNumbers.append(operation)
        }
    }
    
    func clear() {
        pressedNumbers.removeAll()
    }
    
    func calculateResult() {
        let expression = pressedNumbers.joined(separator: "")
        pressedNumbers.removeAll()
        pressedNumbers.append(evaluatePrefix(infixToPrefix(expression)))
    }
    
    func infixToPrefix(_ infix: String) -> String {
        var operators: [String] = []
        var operands: [String] = []
        
        let tokens = infix.split(separator: " ").map { String($0) }
        let precedence: [String: Int] = ["+": 1, "-": 1, "x": 2, "/": 2]
        
        for token in tokens {
            if let _ = Double(token) {
                operands.append(token)
            } else if precedence.keys.contains(token) {
                while let op = operators.last, let opPrecedence = precedence[op], let tokenPrecedence = precedence[token], opPrecedence >= tokenPrecedence {
                    let rightOperand = operands.removeLast()
                    let leftOperand = operands.removeLast()
                    let newExpr = op + " " + leftOperand + " " + rightOperand
                    operands.append(newExpr)
                    operators.removeLast()
                }
                operators.append(token)
            }
        }
        
        while !operators.isEmpty {
            let op = operators.removeLast()
            let rightOperand = operands.removeLast()
            let leftOperand = operands.removeLast()
            let newExpr = op + " " + leftOperand + " " + rightOperand
            operands.append(newExpr)
        }
        
        return operands.last ?? ""
    }
    
    func evaluatePrefix(_ prefix: String) -> String {
        let tokens = prefix.split(separator: " ").reversed().map { String($0) }
        var stack: [Double] = []
        
        for token in tokens {
            if let num = Double(token) {
                stack.append(num)
            } else if stack.count >= 2 {
                let operand1 = stack.removeLast()
                let operand2 = stack.removeLast()
                var result: Double = 0
                
                switch token {
                case "+": result = operand1 + operand2
                case "-": result = operand1 - operand2
                case "x": result = operand1 * operand2
                case "/": result = operand2 != 0 ? operand1 / operand2 : Double.infinity
                default: return "Error"
                }
                stack.append(result)
            }
        }
        
        return stack.last.map { String($0) } ?? "Error"
    }
}
