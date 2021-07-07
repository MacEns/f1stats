//
//  ConstructorRowView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-23.
//

import SwiftUI

struct ConstructorRowView: View {
    @EnvironmentObject var modelData: ModelData
    var team: ConstructorStanding
    
    var body: some View {
        HStack {
            PositionNumberView(position: team.position)
            
            ZStack {
//                RoundedRectangle(cornerRadius: 5.0)
//                    .fill(Color.primary)
//                    .frame(width: 30, height: 30)
                
                Image(teamLogoString(constructorId: team.constructor.constructorID))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 50, maxHeight: 35)
            }// ZStack Image
            
            VStack (alignment: .leading) {
                    Text(team.constructor.name)
                        .font(.title3)
                
                PointsBar(points: team.points, maxPoints: modelData.constructorStandings[0].points)
            }// VStack
            Spacer()

        }// HStack
        
    }// body
    // MARK: - Functions
    func pointPercentage(_ teamPoints: String) -> CGFloat {
        let team: Double = Double(teamPoints) ?? 0
        let leader: Double = Double(self.modelData.constructorStandings[0].points) ?? 0
        return CGFloat(team/leader)
    }// pointPercentage()
    
}// ConstructorRowView



// MARK: - Preview
struct ConstructorRowView_Previews: PreviewProvider {
    static var previews: some View {
        List(0 ..< 5) { item in
            ConstructorRowView(team: ConstructorStanding(position: "1", positionText: "One", points: "123", wins: "4", constructor: Constructor(constructorID: "aston_martin", url: "www.macens.ca", name: "Ens F1", nationality: "Canadian")))
                .environmentObject(ModelData())
        }
    }
}
