//
//  DetailViewModel.swift
//  ExampleMVVM
//
//  Created by hooni on 4/1/22.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    var teamModel: TeamModel
    
    init(model: TeamModel) {
        self.teamModel = model
    }
    
    func getTeamName() -> String {
        return teamModel.name ?? ""
    }
    
    func getTeamFifaCode() -> String {
        return teamModel.fifaCode ?? ""
    }
    
    func getTeamIso2() -> String {
        return teamModel.iso2 ?? ""
    }
    
    func getTeamFlagUrl() -> String {
        return teamModel.flag ?? ""
    }
    
    func getTeamEmoji() -> String {
        return teamModel.emoji ?? ""
    }
    
    func getTeamEmojiString() -> String {
        return teamModel.emojiString ?? ""
    }
}
