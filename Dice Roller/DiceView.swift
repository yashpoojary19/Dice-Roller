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
    @State private var numberOfTimes = 1
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Number of sides").font(.headline)) {
                    Picker("Pick a dice", selection: $currentSelection) {
                        ForEach(0..<diceSides.count) { index in
                            Text("\(diceSides[index])")
                        }
                    }
            
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Number of dice").font(.headline)) {
                    
                    Picker("Number of times", selection: $numberOfTimes) {
                        ForEach(1..<4) {
                            Text("\($0)")
                        }
                        
                    }
                    .pickerStyle(.segmented)
                }

                
                Section {
                    Text("Result: \(result(in: currentSelection, for:numberOfTimes))")
                        .font(.largeTitle)
                }
            }
            .navigationTitle("Roll Them!")
        }
    }
    
    
    func result(in selection: Int, for numberOftimes: Int) -> Int {
        
        let numberOfSides = diceSides[selection]
        
        var possibleOutcomes = [Int]()
        
        var finalArray = [Int]()
        
        for _  in 0..<numberOftimes + 1 {
            
            for numberOfSide in 0..<numberOfSides + 1 {
                possibleOutcomes.append(numberOfSide)
            }
            
            possibleOutcomes.removeAll(where: {
                $0 == 0
            })
            
            
            
            let results = possibleOutcomes.randomElement()!
            
            finalArray.append(results)
            
            
            
            
        }
        
        print(finalArray)
        
        return finalArray.reduce(0, +)
        
        
    }
    
    
    
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
