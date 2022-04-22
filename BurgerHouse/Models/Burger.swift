//
//  Burger.swift
//  BurgerHouse
//
//  Created by Владимир Рубис on 21.04.2022.
//

import Foundation

//struct Burger: Decodable {
//    let name: String
//}

//struct Items: Decodable {
//    var items: Properties
//    var type: String?
//

struct Burger: Decodable {
    var name: String
    var description: String
    var ingredients: [String]
    
}

