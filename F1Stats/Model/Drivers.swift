//
//  Drivers.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-21.
//


import Foundation

// MARK: - Driver
struct Driver: Codable {
    var driverID, permanentNumber, code: String
    var url: String
    var givenName, familyName, dateOfBirth, nationality: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}// Driver



// MARK: - DriverTable
struct DriverTable: Codable {
    var season: String
    var drivers: [Driver]

    enum CodingKeys: String, CodingKey {
        case season
        case drivers = "Drivers"
    }
}// DriverTable


// MARK: - DriverStanding
struct DriverStanding: Codable {
    var position, positionText, points, wins: String
    var driver: Driver
    var constructors: [Constructor]

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
}// Driver Standing
