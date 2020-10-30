//
//  Planet.swift
//  SWapi
//
//  Created by user on 30.10.2020.
//

import Foundation

struct Planet: Codable{
    let name: String
    let rotation_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: Array<String>
    let films: Array<String>
    let created: String
    let edited: String
    let url: String
}
