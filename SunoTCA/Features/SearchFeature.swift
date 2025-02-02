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
        var searchedText: String = ""
        var allTracks: [Album]?

        var selectedTrack: Album?
        @Presents var trackPresentedFromSearch: TrackFeature.State?

        // computed property to filter results
        var filteredTracks: [Album] {
            guard let allTracks = allTracks, !searchedText.isEmpty else {return allTracks ?? []}

            return allTracks.filter { track in
                track.title.lowercased().contains(searchedText.lowercased())
            }
        }
    }

    enum Action {
        case searchButtonPressed
        case updateSearchText(String)

        case trackPressed(Album)
        case trackPresentedFromSearch(PresentationAction<TrackFeature.Action>)
    }

    var body: some ReducerOf<Self> {
        Reduce{ state, action in
            switch action {
            case .searchButtonPressed:
                return .none

            case .updateSearchText(let searchText):
                state.searchedText = searchText
                return .none

            case .trackPressed(let selectedTrack):
//                state.selectedTrack = selectedTrack
                state.trackPresentedFromSearch = TrackFeature.State(selectedTrack: selectedTrack)
                return .none

            case .trackPresentedFromSearch(.dismiss):
                state.trackPresentedFromSearch = nil
//                state.trackPresented = nil
                return .none

            case .trackPresentedFromSearch(.presented(_)):
                return .none
            }
        }
    }
}
