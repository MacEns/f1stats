//
//  F1StatsApp.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-20.
//

import SwiftUI

@main
struct F1StatsApp: App {
    @StateObject var modelData = ModelData()
    var body: some Scene {
        
        
        
        WindowGroup {
            RootView()
                .environmentObject(modelData)
                
        }
    }
}
