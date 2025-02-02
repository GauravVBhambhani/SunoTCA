//
//  TrackFeature.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct TrackFeature {

    @ObservableState
    struct State {
        var selectedTrack: Album?
    }

    enum Action {
        case setTrack(Album)
    }

    var body: some ReducerOf<Self> {
        Reduce{ state, action in

            switch action {
            case .setTrack(let album):
                state.selectedTrack = album
                return .none
            }
        }
    }
}
