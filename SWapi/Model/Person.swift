//
//  Person.swift
//  SWapi
//
//  Created by user on 30.10.2020.
//

import Foundation

struct Person: Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: Array<String>
    let species: Array<String>
    let vehicles: Array<String>
    let starships: Array<String>
    let created: String
    let edited: String
    let url: String
}

struct People: Codable{
    let count: Int
    let next: String?
    let previous: String?
    let results: Array<Person>
}


