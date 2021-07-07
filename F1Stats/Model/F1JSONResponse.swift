//
//  Teams.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-20.
//
import Foundation

// MARK: - Welcome
struct F1JSONResponse: Codable {
    var mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}// F1JSONResponse



// MARK: - MRData
struct MRData: Codable {
    var xmlns: String
    var series: String
    var url: String
    var limit, offset, total: String
    var constructorTable: ConstructorTable?
    var standingsTable: StandingsTable?
    var raceTable: RaceTable?

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case constructorTable = "ConstructorTable"
        case standingsTable = "StandingsTable"
        case raceTable = "RaceTable"
    }
}// MRData

