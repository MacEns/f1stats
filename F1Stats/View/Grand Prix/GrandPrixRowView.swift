//
//  GrandPrixRowView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-07-07.
//

import SwiftUI

struct GrandPrixRowView: View {
    // MARK: - Properties
    var race: Race
    
    // MARK: - Body
    var body: some View {
        
        HStack {
            VStack {
                Text(race.raceName)
                    .font(.title)
                
                Text(race.circuit.circuitName)
            }// VStack
            
            Spacer()
            
            VStack {
                Text("Round \(race.round)")
            }// VStack
        }// HStack
                
        
    }// body
}// GrandPrixRowView


// MARK - Preview
struct GrandPrixRowView_Previews: PreviewProvider {
    static var previews: some View {
        GrandPrixRowView(race: Race(season: "2021", round: "1", url: "https://en.wikipedia.org/wiki/2021_Bahrain_Grand_Prix", raceName: "Bahrain Grand Prix", circuit: Circuit(circuitID: "bahrain", url: "http://en.wikipedia.org/wiki/Bahrain_International_Circuit", circuitName: "Bahrain International Circuit", location: Location(lat: "26.0325", long: "50.5106", locality: "Sakhir", country: "Bahrain")), date: "2021-03-28", time: "15:00:00Z"))
            .previewLayout(.sizeThatFits)
    }
}// Preview
