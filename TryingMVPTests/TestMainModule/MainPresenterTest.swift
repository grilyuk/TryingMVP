//
//  MainPresenterTest.swift
//  TryingMVPTests
//
//  Created by Григорий Данилюк on 13.01.2023.
//

import XCTest
@testable import TryingMVP

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
    
    
}

final class MainPresenterTest: XCTestCase {

    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!
    
    
    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", secondName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModuleIsNotNill() {
        XCTAssertNotNil(view, "view is not nill")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.secondName, "Bar")
    }
}
