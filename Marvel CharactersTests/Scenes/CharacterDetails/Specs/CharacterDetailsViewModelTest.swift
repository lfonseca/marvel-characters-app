//
//  CharacterDetailsViewModelTest.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Quick
import Nimble

@testable import Marvel_Characters

class CharacterDetailsViewModelTest: QuickSpec {
    
    override func spec() {
        describe("CharacterDetails ViewModel") {
            let testCharacter = TestCharacter()
            let viewModel = CharacterDetailsViewModel(character: testCharacter)
            
            describe("from the character passed") {
                it("gets its title") {
                    expect(viewModel.title).to(equal(testCharacter.name))
                }
                it("gets its image URL") {
                    expect(viewModel.imageURL).to(equal(testCharacter.thumbnailURL))
                }
                it("gets its info") {
                    expect(viewModel.info(for: 0, at: 0)).to(equal(testCharacter.comics[0]))
                    expect(viewModel.info(for: 1, at: 0)).to(equal(testCharacter.stories[0]))
                    expect(viewModel.info(for: 2, at: 0)).to(equal(testCharacter.series[0]))
                    expect(viewModel.info(for: 3, at: 0)).to(equal(""))
                }
                it("gets the number of rows") {
                    expect(viewModel.numberOfRows(for: 0)).to(equal(testCharacter.comics.count))
                    expect(viewModel.numberOfRows(for: 1)).to(equal(testCharacter.stories.count))
                    expect(viewModel.numberOfRows(for: 2)).to(equal(testCharacter.series.count))
                    expect(viewModel.numberOfRows(for: 3)).to(equal(0))
                }
            }
            it("sets number of sections to 3") {
                expect(viewModel.numberOfSections).to(equal(3))
            }
            it("sets header titles") {
                expect(viewModel.title(for: 0)).to(equal("Revistas"))
                expect(viewModel.title(for: 1)).to(equal("Histórias"))
                expect(viewModel.title(for: 2)).to(equal("Séries"))
                expect(viewModel.title(for: 3)).to(equal(""))
            }
        }
    }
    
}
