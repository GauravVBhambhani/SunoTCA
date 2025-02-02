//
//  SearchFeature.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/2/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SearchFeature {


    @ObservableState
    struct State {
        var searchedText: String?
        var allTracks: [Album]
    }

    enum Action {
        case searchButtonPressed
    }

    var body: some ReducerOf<Self> {
        Reduce{ state, action in

            return .none
        }
    }
}
