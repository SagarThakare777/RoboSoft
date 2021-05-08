//
//  DetailsInfoModel.swift
//  DemoApplication
//
//  Created by SAGAR THAKARE on 08/05/21.
//

import Foundation

// MARK: - DataModelDetailInfo
struct DataModelDetailInfo: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Result]?
}


struct ResultInfo: Codable {
    var resultData : [Result]
}

// MARK: - Result
struct Result: Codable {
    let name, rotationPeriod, orbitalPeriod, diameter: String?
    let climate, gravity, terrain, surfaceWater: String?
    let population: String?
    let residents, films: [String]?
    let created, edited: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

