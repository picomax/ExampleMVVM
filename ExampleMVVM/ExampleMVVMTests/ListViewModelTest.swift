//
//  ListViewModelTest.swift
//  ExampleMVVMTests
//
//  Created by hooni on 4/1/22.
//

import XCTest
@testable import ExampleMVVM

class ListViewModelTests: XCTestCase {

    var listViewModel: ListViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.listViewModel = ListViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListViewModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let sectionCount = listViewModel?.getSectionCount()
        XCTAssertEqual(sectionCount, 8)
        
        let sectionTitle = listViewModel?.getSectionTitle(index: 1)
        XCTAssertEqual(sectionTitle, "Group B")
        
        let itemCount = listViewModel?.getItemCount(index: 1)
        XCTAssertEqual(itemCount, 4)
        
        let item = listViewModel?.getItem(indexPath: IndexPath(row: 1, section: 1))
        XCTAssertTrue(item != nil)
        
        let totalItemCount = listViewModel?.getTotalItemCount()
        XCTAssertEqual(totalItemCount, 32)
        
        let totalItems = listViewModel?.getTotalItems()
        XCTAssertTrue(totalItems != nil)
        XCTAssertEqual(totalItems?.count, 32)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
