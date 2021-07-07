//
//  ConstructorDetailView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-29.
//

import SwiftUI

struct ConstructorDetailView: View {
    @EnvironmentObject var modelData: ModelData
    var constructor: ConstructorStanding
    
    
    var body: some View {
        VStack {
            Image(teamLogoString(constructorId: constructor.constructor.constructorID))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            
            
            Group {
                Text("Position: \(constructor.position)")
                Text("Points: \(constructor.points)")
                Text("Wins: \(constructor.wins)")
                Text("Nationality: \(constructor.constructor.name)")
            }
            .font(.body)
            
        }// VStack
        .navigationBarTitle(constructor.constructor.name)
    }// body
}// ConstructorDetailView



// MARK: - Preview
struct ConstructorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorDetailView(constructor: ConstructorStanding(position: "1", positionText: "One", points: "123", wins: "3", constructor: Constructor(constructorID: "alfa", url: "macens.ca", name: "Ens F1", nationality: "Canadian")))
    }
}
