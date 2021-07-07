//
//  GrandPrixDetailView.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-07-07.
//

import SwiftUI

struct GrandPrixDetailView: View {
    // MARK: - Properties
    var race: Race
    
    // MARK - Body
    var body: some View {
        VStack {
            Text(race.circuit.circuitName)
        }// VStack
        .navigationBarTitle(race.raceName)
    }// body
}// GrandPrixDetailView


// MARK: - Preview
struct GrandPrixDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GrandPrixDetailView(race: Race(season: "2021", round: "1", url: "https://en.wikipedia.org/wiki/2021_Bahrain_Grand_Prix", raceName: "Bahrain Grand Prix", circuit: Circuit(circuitID: "bahrain", url: "http://en.wikipedia.org/wiki/Bahrain_International_Circuit", circuitName: "Bahrain International Circuit", location: Location(lat: "26.0325", long: "50.5106", locality: "Sakhir", country: "Bahrain")), date: "2021-03-28", time: "15:00:00Z"))
    }
}/// Preview
