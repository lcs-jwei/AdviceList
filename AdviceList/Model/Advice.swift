//
//  Advice.swift
//  AdviceList
//
//  Created by Justin Zack Wei on 2023-04-19.
//

import Blackbird
import Foundation


struct Advice: Identifiable, Codable, BlackbirdModel{
    @BlackbirdColumn var advice: String
    @BlackbirdColumn var id: Int
}

let exampleAdvice = Advice(advice: "Some of life's best lessons are learnt at the worst times.", id: 164)
