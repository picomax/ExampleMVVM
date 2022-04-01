//
//  DetailViewModelTest.swift
//  ExampleMVVMTests
//
//  Created by hooni on 4/1/22.
//

import XCTest
@testable import ExampleMVVM

class DetailViewModelTest: XCTestCase {

    var listViewModel: ListViewModel?
    var detailViewModel: DetailViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.listViewModel = ListViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDetailViewModel() throws {
        let teamModel = listViewModel?.getItem(indexPath: IndexPath(row: 0, section: 4))
        XCTAssertTrue(teamModel != nil)
        
        detailViewModel = DetailViewModel(model: teamModel!)
        XCTAssertTrue(detailViewModel != nil)
        
        let name = detailViewModel?.getTeamName()
        XCTAssertTrue(name != nil)
        XCTAssertEqual(name, "Brazil")
        
        let fifaCode = detailViewModel?.getTeamFifaCode()
        XCTAssertTrue(fifaCode != nil)
        XCTAssertEqual(fifaCode, "BRA")
        
        let iso2Code = detailViewModel?.getTeamIso2()
        XCTAssertTrue(iso2Code != nil)
        XCTAssertEqual(iso2Code, "br")
        
        let flag = detailViewModel?.getTeamFlagUrl()
        XCTAssertTrue(flag != nil)
        XCTAssertEqual(flag, "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/720px-Flag_of_Brazil.png")
        
        let emoji = detailViewModel?.getTeamEmoji()
        XCTAssertTrue(emoji != nil)
        XCTAssertEqual(emoji, "flag-br")
        
        let emojiString = detailViewModel?.getTeamEmojiString()
        XCTAssertTrue(emojiString != nil)
        XCTAssertEqual(emojiString, "🇧🇷")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
