//
//  ExampleResponse.swift
//  MoonCodeTemplate
//
//  Created by Komsit Chusangthong on 8/7/2568 BE.
//
import Foundation

struct ExampleResponse: Codable {
    let id: String
    let name: String
    let data: ExampleDataItem?
}

struct ExampleDataItem: Codable {
    let generation: String
    let price: String
    let capacity: String
}


/*
 {
   "id": "13",
   "name": "Apple iPad Air",
   "data": {
     "Generation": "4th",
     "Price": "519.99",
     "Capacity": "256 GB"
   }
 */
