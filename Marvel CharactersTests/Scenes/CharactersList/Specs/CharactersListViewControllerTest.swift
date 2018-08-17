//
//  CharactersListViewControllerTest.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Quick
import Nimble
import UIKit

@testable import Marvel_Characters

class CharactersListViewControllerTest: QuickSpec {
    
    override func spec() {
        describe("Characters List View") {
            let mockViewModel = MockCharactersListViewModel()
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: CharactersListViewController.self))
            var view: CharactersListViewController!
            
            beforeEach {
                view = storyboard.instantiateViewController(withIdentifier: "CharactersListViewController") as? CharactersListViewController
            }
            
            describe("without viewModel") {
                beforeEach {
                    view.viewModel = nil
                }
                
                it("shows empty table") {
                    view.updateView(for: .dataUpdated)
                    let numberOfCells = view.tableView.numberOfRows(inSection: 0)
                    expect(numberOfCells).to(equal(0))
                }
            }
            
            describe("with viewModel") {
                beforeEach {
                    view.viewModel = mockViewModel
                }
                
                it("asks it for data on load") {
                    view.loadViewIfNeeded()
                    expect(mockViewModel.didCallLoadCharacters).to(beTrue())
                }
                it("gets tableview data from it") {
                    let numberOfCells = view.tableView.numberOfRows(inSection: 0)
                    let firstCell = view.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! CharacterCell
                    expect(numberOfCells).to(equal(mockViewModel.numberOfCharacters))
                    expect(firstCell.characterNameLabel.text).to(equal(mockViewModel.testCharacter.name))
                }
                it("pass selected row to viewModel") {
                    let indexPath = IndexPath(row: 0, section: 0)
                    view.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
                    view.tableView.delegate?.tableView!(view.tableView, didSelectRowAt: indexPath)
                    expect(mockViewModel.didCallSelectCharacter).to(beTrue())
                }
            }
            
        }
    }
    
}
