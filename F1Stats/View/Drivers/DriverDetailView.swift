//
//  DriverDetailView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-29.
//

import SwiftUI

struct DriverDetailView: View {
    // MARK: - Properties
    @EnvironmentObject var modelData: ModelData
    var driver: DriverStanding
    
    // MARK: - Body
    var body: some View {
        VStack (alignment: .leading) {
            Group {
                HStack {
                    Text("Championship Position:")
                    Spacer()
                    Text(driver.position)
                }
                HStack {
                    Text("Points:")
                    Spacer()
                    Text(driver.points)
                }
                HStack {
                    Text("Wins:")
                    Spacer()
                    Text(driver.wins)
                }
                HStack {
                    Text("Team:")
                    Spacer()
                    Text(driver.constructors[0].name)
                }
            }// Group
            .font(.headline)
            
        }// VStack
        .padding()
        .navigationBarTitle("\(driver.driver.familyName) \(driver.driver.familyName)")
        
    }// body
}// DriverDetailView



// MARK: - Preview
struct DriverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailView(driver: DriverStanding(position: "1", positionText: "One", points: "123", wins: "12", driver: Driver(driverID: "ens", permanentNumber: "16", code: "ENS", url: "https://macens.ca", givenName: "Mac", familyName: "Ens", dateOfBirth: "1995-07-22", nationality: "Canadian"), constructors: [Constructor(constructorID: "redbull", url: "macens.ca", name: "Red Bull Racing", nationality: "Canadian")]) )
            .environmentObject(ModelData())
    }
}// Preview
