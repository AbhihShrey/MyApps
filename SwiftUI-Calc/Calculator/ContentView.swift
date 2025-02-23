import SwiftUI

struct ContentView: View {
    @StateObject private var calculator = CalculatorModel()
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.primary)
                .frame(width: 315, height: 120)
                .overlay(
                    Text("\(calculator.pressedNumbers.joined(separator: ""))")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                )
            
            HStack {
                NumberButton(number: 1, calculator: calculator)
                NumberButton(number: 2, calculator: calculator)
                NumberButton(number: 3, calculator: calculator)
                OperatorButton(symbol: " + ", calculator: calculator)
            }
            HStack {
                NumberButton(number: 4, calculator: calculator)
                NumberButton(number: 5, calculator: calculator)
                NumberButton(number: 6, calculator: calculator)
                OperatorButton(symbol: " - ", calculator: calculator)
            }
            HStack {
                NumberButton(number: 7, calculator: calculator)
                NumberButton(number: 8, calculator: calculator)
                NumberButton(number: 9, calculator: calculator)
                OperatorButton(symbol: " x ", calculator: calculator)
            }
            HStack {
                ClearButton(calculator: calculator)
                NumberButton(number: 0, calculator: calculator)
                OperatorButton(symbol: ".", calculator: calculator)
                OperatorButton(symbol: " / ", calculator: calculator)
            }
            HStack {
                EqualButton(calculator: calculator)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
