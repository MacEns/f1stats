//
//  Constructor.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-29.
//

import Foundation


// MARK: - Constructor
struct Constructor: Codable {
    var constructorID: String
    var url: String
    var name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}// Constructor


// MARK: - ConstructorStanding
struct ConstructorStanding: Codable {
    var position, positionText, points, wins: String
    var constructor: Constructor

    enum CodingKeys: String, CodingKey {
        case position, positionText, points, wins
        case constructor = "Constructor"
    }
}// ConstructorStanding



// MARK: - ConstructorTable
struct ConstructorTable: Codable {
    var season: String
    var constructors: [Constructor]

    enum CodingKeys: String, CodingKey {
        case season
        case constructors = "Constructors"
    }
}// ConstructorTable
