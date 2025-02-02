//
//  AlbumFeature.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AlbumFeature {

    @ObservableState
    struct State {
        var selectedAlbum: Album
        var allTracks: [Album]
        
        @Presents var trackPresented: TrackFeature.State?
    }

    enum Action {
        case trackPressed(Album)
        case trackPresented(PresentationAction<TrackFeature.Action>)
    }

    var body: some ReducerOf<Self> {
        Reduce{ state, action in
            switch action {

            case .trackPressed(let album):
                state.trackPresented = TrackFeature.State(selectedTrack: album)
                return .none

            case .trackPresented(.dismiss):
                state.trackPresented = nil
                return .none

            case .trackPresented(.presented(_)):
                return .none
            }
        }
        .ifLet(\.$trackPresented, action: \.trackPresented) {
            TrackFeature()
        }
    }
}
