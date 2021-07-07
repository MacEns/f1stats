//
//  ModelData.swift
//  F1Stats
//
//  Created by Mac Ens on 2021-06-20.
//

import Foundation
import SwiftyJSON
import Combine


class ModelData: ObservableObject {
    
    @Published var constructorStandings: [ConstructorStanding] = []
    @Published var driverStandings: [DriverStanding] = []
    @Published var grandPrix: [Race] = []
    
    // COMBINE SUBSCRIPTIONS
    var driverSubscription: AnyCancellable?
    var constructorSubscription: AnyCancellable?
    var grandPrixSubscription: AnyCancellable?
    
    private let driversURL: URL = URL(string: "https://ergast.com/api/f1/current/driverStandings.json")!
    private let constructorsURL: URL = URL(string: "https://ergast.com/api/f1/current/constructorStandings.json")!
    private let scheduleURL: URL = URL(string: "https://ergast.com/api/f1/current.json")!
    
    
    // MARK: - init()
    init() {
        getConstructorStandings()
        getDriverStandings()
    }// init()
    
    
    

    // MARK: - Constructor Functions
    func getConstructorStandings() {
        // Download from API
        constructorSubscription = NetworkingManager.download(url: constructorsURL)
            .decode(type: F1JSONResponse.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure (let error):
                    print("\nError fetching Constructor Standings: \(error.localizedDescription)\n")
                }//switch
            } receiveValue: { [weak self] (data) in
                self?.constructorStandings = data.mrData.standingsTable?.standingsLists[0].constructorStandings ?? self!.loadConstructorSampleData()
                self?.driverSubscription?.cancel()
            }
        
        print("End getConstructorStandings()")
    }// getConstructorStandings()
    
    

    // MARK: - Driver Functions
    func getDriverStandings() {
        // Download from API
        driverSubscription = NetworkingManager.download(url: driversURL)
            .decode(type: F1JSONResponse.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure (let error):
                    print("\nError fetching Driving standings: \(error.localizedDescription)\n")
                }//switch
            } receiveValue: { [weak self] (data) in
                self?.driverStandings = data.mrData.standingsTable?.standingsLists[0].driverStandings ?? self!.loadDriverSampleData()
                self?.driverSubscription?.cancel()
            }

            print("End getDriverStandings()")
    }// getDriverStandings()
    
    
    
    // MARK: - Sample Data
    private func loadDriverSampleData() -> [DriverStanding] {
        // Load from file for testing
        var sampleStandings: [DriverStanding] = []
        
        if let path = Bundle.main.path(forResource: "driversStandings", ofType: "json") {
            print("Path is good.")
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                
                let standings = try JSONDecoder().decode(F1JSONResponse.self, from: data)
                let driverStandings = standings.mrData.standingsTable!.standingsLists[0].driverStandings!
                
                for driver in driverStandings {
                    sampleStandings.append(driver)
                }// for driver
            }// do
            catch {
                print(error)
            }// catch
        }// if let path
        else {
            print("Path is bad.")
        }// else
        return sampleStandings
    }// loadDriverSampleData()
    
    
    private func loadConstructorSampleData() -> [ConstructorStanding] {
        // Load from file for testing
        var sampleStandings: [ConstructorStanding] = []
        if let path = Bundle.main.path(forResource: "constructorsStandings", ofType: "json") {
            print("Path is good.")
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                
                let standings = try JSONDecoder().decode(F1JSONResponse.self, from: data)
                let constructorStandings = standings.mrData.standingsTable!.standingsLists[0].constructorStandings!
                
                for team in constructorStandings {
                    sampleStandings.append(team)
                }// for driver
            }// do
            catch {
                print(error)
            }// catch
        }// if let path
        else {
            print("Path is bad.")
        }// else
        return sampleStandings
    }// loadConstructorSampleData()
    
    
}// ModelData



// MARK: - TeamLogoString
func teamLogoString(constructorId: String) -> String {
    var result: String = ""
    
    switch (constructorId) {
    case "red_bull":
        result = "RedBull-BW"
    case "mercedes":
        result = "Mercedes-BW"
    case "mclaren":
        result = "McLaren-BW"
    case "ferrari":
        result = "Ferrari-BW"
    case "alphatauri":
        result = "AlphaTauri-BW"
    case "aston_martin":
        result = "AstonMartin-BW"
    case "alpine":
        result = "Alpine-BW"
    case "alfa":
        result = "AlfaRomeo-BW"
    case "williams":
        result = "Williams-BW"
    case "haas":
        result = "Haas-BW"
    default:
        result = ""
    }// switch
    
    return result
}// teamLogo()


