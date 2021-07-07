//
//  StandingsTable.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-29.
//

import Foundation


//
// To read values from URLs:
//
//   let task = URLSession.shared.standingsTableTask(with: url) { standingsTable, response, error in
//     if let standingsTable = standingsTable {
//       ...
//     }
//   }
//   task.resume()

// MARK: - StandingsTable
struct StandingsTable: Codable {
    var season: String
    var standingsLists: [StandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}// StandingsTable


// MARK: - StandingsList
struct StandingsList: Codable {
    var season, round: String
    var driverStandings: [DriverStanding]?
    var constructorStandings: [ConstructorStanding]?

    enum CodingKeys: String, CodingKey {
        case season, round
        case driverStandings = "DriverStandings"
        case constructorStandings = "ConstructorStandings"
    }
}// StandingsList
