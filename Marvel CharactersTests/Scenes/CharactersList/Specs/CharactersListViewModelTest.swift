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
            var view: MockCharactersListView!
            var coordinator: MockCharactersFlowCoordinator!
            var service: CharactersAPIClient!
            var viewModel: CharactersListViewModel!
            
            beforeEach {
                view = MockCharactersListView()
                coordinator = MockCharactersFlowCoordinator()
            }
            
            describe("with successful service") {
                beforeEach {
                    service = MockMarvelAPIClient.forSuccess()
                    viewModel = CharactersListViewModel(view: view, coordinator: coordinator, service: service)
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
                it("ask coordinator for navigation") {
                    viewModel.loadCharacters()
                    viewModel.didSelectCharacter(at: 0)
                    expect(coordinator.didCallShowDetails).to(beTrue())
                    expect(coordinator.characterReceived?.name).to(equal("3-D Man"))
                }
            }
            describe("with failed service") {
                beforeEach {
                    service = MockMarvelAPIClient.forFailure(with: NSError())
                    viewModel = CharactersListViewModel(view: view, coordinator: coordinator, service: service)
                }
                it("tell view about failure") {
                    viewModel.loadCharacters()
                    expect(view.didUpdateToFailure).to(beTrue())
                }
            }
        }
    }
    
}
