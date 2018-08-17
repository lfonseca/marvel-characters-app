//
//  CharacterDetailsViewControllerTest.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Quick
import Nimble
import UIKit

@testable import Marvel_Characters

class CharacterDetailsViewControllerTest: QuickSpec {
    
    override func spec() {
        describe("Character Details View") {
            let viewModel = MockCharacterDetailsViewModel()
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: CharacterDetailsViewController.self))
            var view: CharacterDetailsViewController!
            
            beforeEach {
                view = storyboard.instantiateViewController(withIdentifier: "CharacterDetailsViewController") as? CharacterDetailsViewController
            }
            
            describe("without viewModel") {
                beforeEach {
                    view.viewModel = nil
                    view.loadViewIfNeeded()
                    view.characterDetailsTableView.reloadData()
                }
                
                it("shows empty table") {
                    let numberOfSections = view.characterDetailsTableView.numberOfSections
                    expect(numberOfSections).to(equal(0))
                }
            }
            
            describe("with vieModel") {
                beforeEach {
                    view.viewModel = viewModel
                    view.loadViewIfNeeded()
                    view.characterDetailsTableView.reloadData()
                }
                
                it("gets its title from viewModel") {
                    expect(view.title).to(equal(viewModel.title))
                }
                it("gets number of section from viewModel") {
                    let numberOfSections = view.characterDetailsTableView.numberOfSections
                    expect(numberOfSections).to(equal(viewModel.numberOfSections))
                }
                it("gets number of rows from viewModel") {
                    let section = 0
                    let numberOfRows = view.characterDetailsTableView.numberOfRows(inSection: section)
                    expect(numberOfRows).to(equal(viewModel.numberOfRows(for: section)))
                }
                it("gets cell content from viewModel") {
                    let indexPath = IndexPath(row: 0, section: 0)
                    let cell = view.characterDetailsTableView.cellForRow(at: indexPath)
                    expect(cell?.textLabel?.text).to(equal(viewModel.info(for: indexPath.section, at: indexPath.row)))
                }
            }
            
        }
    }
    
}
