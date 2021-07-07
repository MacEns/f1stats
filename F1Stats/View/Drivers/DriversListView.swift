//
//  DriversListView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-21.
//

import SwiftUI

struct DriversListView: View {
    // MARK: - Properties
    @EnvironmentObject var modelData: ModelData

    // MARK: - Body
    var body: some View {

        NavigationView {
            List {
                ForEach(modelData.driverStandings, id: \.driver.driverID) { driver in
                    NavigationLink( destination: DriverDetailView(driver: driver), label: {
                            
                            DriverRowView(driver: driver)
                                .environmentObject(modelData)
                            
                        })// NavigationLink
                    }// ForEach drivers
                
                
                
            }// List
            .listStyle(InsetListStyle())
            .navigationBarTitle("Drivers")
            
        }// NavigationView
        
    }// body
    
    
    
}// DriversListView

struct DriversListView_Previews: PreviewProvider {
    static var previews: some View {
        DriversListView()
            .environmentObject(ModelData())
    }
}
