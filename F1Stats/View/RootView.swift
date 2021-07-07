//
//  RootView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-21.
//

import SwiftUI

struct RootView: View {
    // MARK: - Properties
    @EnvironmentObject var modelData: ModelData
    @State private var selectedTab = ""
    
    // MARK: - Body
    var body: some View {
        TabView (selection: $selectedTab) {
            ConstructorsListView()
                .environmentObject(modelData)
                .tabItem {
                    Label("Constructors", systemImage: "car.2.fill")
                }
                .tag("Constructors")
            
            DriversListView()
                .environmentObject(modelData)
                .tabItem {
                    Label("Drivers", systemImage: "person.fill")
                }
                .tag("Drivers")
            
            GrandPrixListView()
                .environmentObject(modelData)
                .tabItem {
                    Label("Grand Prix", systemImage: "calendar")
                }
                .tag("Races")
            
            
            // The onTapGesture modifiers have been removed to allow for NavigationLink to work within the list views
            
        }// TabView
    }// body
}// RootView

// MARK: - Preview
struct RootView_Previews: PreviewProvider {
    
    static var previews: some View {
        RootView()
            .environmentObject(ModelData())
    }
}
