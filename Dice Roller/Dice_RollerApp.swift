//
//  Dice_RollerApp.swift
//  Dice Roller
//
//  Created by Yash Poojary on 15/12/21.
//

import SwiftUI

@main
struct Dice_RollerApp: App {
    
    @StateObject private var dataContoller = DataController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataContoller.container.viewContext)
        }
    }
}
