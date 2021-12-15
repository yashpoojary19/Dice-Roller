//
//  DiceView.swift
//  Dice Roller
//
//  Created by Yash Poojary on 15/12/21.
//

import SwiftUI

struct DiceView: View {
    
    
    let diceSides: [Int] = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var currentSelection = 1
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("Pick a dice", selection: $currentSelection) {
                        ForEach(0..<diceSides.count) { index in
                            Text("\(diceSides[index]) sides")
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                
                Section {
                    Text("Result: \(result(for: currentSelection))")
                        .font(.largeTitle)
                }
            }
            .navigationTitle("Roll Them!")
        }
    }
    
    func result(for selection: Int) -> Int {
        
        let numberOfSides = diceSides[selection]
        
        var possibleOutcomes = [Int]()
        
        for numberOfSide in 0..<numberOfSides + 1 {
            possibleOutcomes.append(numberOfSide)
        }
        
        possibleOutcomes.remove(at: 0)
        print(possibleOutcomes)
        
        return possibleOutcomes.randomElement()!
        
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
