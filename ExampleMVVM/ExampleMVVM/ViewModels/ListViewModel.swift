//
//  ListViewModel.swift
//  ExampleMVVM
//
//  Created by hooni on 4/1/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    var dataModel = DataModel()
    var groups: [GroupModel] = []
    var allteams: [TeamModel] = []
    
    init() {
        dataModel = DataService.getLocalData()
        
        if let a = dataModel.groups?.a { makeup(a) }
        if let b = dataModel.groups?.b { makeup(b) }
        if let c = dataModel.groups?.c { makeup(c) }
        if let d = dataModel.groups?.d { makeup(d) }
        if let e = dataModel.groups?.e { makeup(e) }
        if let f = dataModel.groups?.f { makeup(f) }
        if let g = dataModel.groups?.g { makeup(g) }
        if let h = dataModel.groups?.h { makeup(h) }
    }
    
    private func makeup(_ group: GroupModel) {
        allteams += group.teams
        let sortedTeams = group.teams.sorted { $0.name! < $1.name! }
        if sortedTeams.count > 0 {
            let max = sortedTeams.count > 3 ? 3 : sortedTeams.count - 1;
            groups.append(GroupModel(name: group.name, winner: group.winner, runnerup: group.runnerup, teams: Array(sortedTeams[0...max])))
        }
    }
    
    func getSectionCount() -> Int {
        return groups.count
    }
    
    func getSectionTitle(index: Int) -> String {
        if index < groups.count {
            return groups[index].name ?? ""
        }
        return ""
    }
    
    func getItemCount(index: Int) -> Int {
        return groups[index].teams.count
    }
    
    func getItem(indexPath: IndexPath) -> TeamModel {
        return groups[indexPath.section].teams[indexPath.row]
    }
    
    func getTotalItemCount() -> Int {
        return allteams.count
    }
    
    func getTotalItems() -> [TeamModel] {
        return allteams
    }
}
