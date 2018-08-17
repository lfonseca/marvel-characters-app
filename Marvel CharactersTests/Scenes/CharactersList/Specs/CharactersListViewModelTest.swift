//
//  CharactersListViewModelTest.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Quick
import Nimble

@testable import Marvel_Characters

class CharactersListViewModelTest: QuickSpec {
    
    override func spec() {
        describe("Characters list view model") {
            describe("with successful service") {
                var view: MockCharactersListView!
                var service: CharactersAPIClient!
                var viewModel: CharactersListViewModel!
                beforeEach {
                    view = MockCharactersListView()
                    service = MockMarvelAPIClient.forSuccess()
                    viewModel = CharactersListViewModel(view: view, service: service)
                }
                it("set view loading while fetching") {
                    viewModel.loadCharacters()
                    expect(view.didUpdateToLoading).to(beTrue())
                }
                it("append results") {
                    expect(viewModel.numberOfCharacters).to(equal(0))
                    viewModel.loadCharacters()
                    expect(viewModel.numberOfCharacters).to(equal(2))
                }
                it("tell view about new data after fetch") {
                    viewModel.loadCharacters()
                    expect(view.didUpdateToDataUpdated).to(beTrue())
                }
                it("pass presentation data to view") {
                    viewModel.loadCharacters()
                    expect(viewModel.character(for: 0).name).to(equal("3-D Man"))
                }
            }
            describe("with failed service") {
                var view: MockCharactersListView!
                var service: CharactersAPIClient!
                var viewModel: CharactersListViewModel!
                beforeEach {
                    view = MockCharactersListView()
                    service = MockMarvelAPIClient.forFailure(with: NSError())
                    viewModel = CharactersListViewModel(view: view, service: service)
                }
                it("tell view about failure") {
                    viewModel.loadCharacters()
                    expect(view.didUpdateToFailure).to(beTrue())
                }
            }
        }
    }
    
}
