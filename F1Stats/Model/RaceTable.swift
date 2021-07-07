//
//  RaceTable.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-07-07.
//

import Foundation

// MARK: - RaceTable
struct RaceTable: Codable {
    let season: String
    let races: [Race]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}// RaceTable


// MARK: - Race
struct Race: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date, time: String

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
    }
}// Race


// MARK: - Circuit
struct Circuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}// Circuit



// MARK: - Location
struct Location: Codable {
    let lat, long, locality, country: String
}// Location

