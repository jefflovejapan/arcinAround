//
//  Person.swift
//  scopes
//
//  Created by Jeffrey Blagdon on 10/4/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import Foundation

let json = """
{
"name": "Darth Vader",
"height": "202",
"mass": "136",
"hair_color": "none",
"skin_color": "white",
"eye_color": "yellow",
"birth_year": "41.9BBY",
"gender": "male",
"homeworld": "https://swapi.co/api/planets/1/",
"films": [
"https://swapi.co/api/films/2/",
"https://swapi.co/api/films/6/",
"https://swapi.co/api/films/3/",
"https://swapi.co/api/films/1/"
],
"species": [
"https://swapi.co/api/species/1/"
],
"vehicles": [],
"starships": [
"https://swapi.co/api/starships/13/"
],
"created": "2014-12-10T15:18:20.704000Z",
"edited": "2014-12-20T21:17:50.313000Z",
"url": "https://swapi.co/api/people/4/"
}
"""

struct Person: Codable {
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    var homeworld: URL
    var films: [URL]
    var species: [URL]
    var vehicles: [URL]
    var starships: [URL]
    var created: String
    var edited: String
    var url: URL

    private enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case starships
        case created
        case edited
        case url
    }
}
