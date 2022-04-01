//
//  DataModel.swift
//  ExampleMVVM
//
//  Created by hooni on 4/1/22.
//

import Foundation

struct DataModel: Codable {
    var groups: LetterModel?
}

struct LetterModel: Codable {
    var a: GroupModel?
    var b: GroupModel?
    var c: GroupModel?
    var d: GroupModel?
    var e: GroupModel?
    var f: GroupModel?
    var g: GroupModel?
    var h: GroupModel?
}

struct GroupModel: Codable {
    var name: String?
    var winner: Int?
    var runnerup: Int?
    var teams: [TeamModel]
}

struct TeamModel: Codable {
    var id: Int?
    var name: String?
    var fifaCode: String?
    var iso2: String?
    var flag: String?
    var emoji: String?
    var emojiString: String?
}
