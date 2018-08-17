//
//  MockCharactersListView.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

@testable import Marvel_Characters

class MockCharactersListView: CharactersListView {
    var viewModel: CharactersListBusinessLogic?
    
    var didUpdateToLoading = false
    var didUpdateToDataUpdated = false
    var didUpdateToFailure = false
    
    func updateView(for state: CharactersListState) {
        switch state {
        case .loading:
            didUpdateToLoading = true
        case .dataUpdated:
            didUpdateToDataUpdated = true
        case .failure:
            didUpdateToFailure = true
        }
    }
    
}
