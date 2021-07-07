//
//  DriverRowView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-24.
//

import SwiftUI

struct DriverRowView: View {
    // MARK: - Properties
    @EnvironmentObject var modelData: ModelData
    var driver: DriverStanding
    
    
    // MARK: - Body
    var body: some View {
        HStack (alignment: .center) {
            PositionNumberView(position: driver.position)
            
            VStack( alignment: .leading) {
                
                HStack (alignment: .center) {
                    Text("\(driver.driver.givenName) \(driver.driver.familyName)")
                        .font(.title3)
                    Text(driver.driver.permanentNumber)
                        .font(.body)
                }// HStack
                    Spacer()

                    PointsBar(points: driver.points, maxPoints: modelData.driverStandings[0].points)
            }// VStack

        }// HStack
    }// body
    
    // MARK: - Functions
    func pointPercentage(driverPoints: String) -> CGFloat {
        let driver: Double = Double(driverPoints) ?? 0
        let leader: Double = Double(self.modelData.driverStandings[0].points) ?? 0
        print("point percentage: Drivers")
        return CGFloat(driver/leader)
    }
    
}// DriverRowView

// MARK: - Preview
struct DriverRowView_Previews: PreviewProvider {
    static var previews: some View {
        List(0 ..< 5) { item in
            DriverRowView(driver: DriverStanding(position: "1", positionText: "One", points: "123", wins: "4", driver: Driver(driverID: "ens", permanentNumber: "16", code: "ENS", url: "https://macens.ca", givenName: "Mac", familyName: "Ens", dateOfBirth: "1995-07-22", nationality: "Canadian"), constructors: [Constructor(constructorID: "alfa", url: "https://macens.ca", name: "Ens F1", nationality: "Canadian")]))
                .environmentObject(ModelData())
        }
    }
}
