//
//  ExploreFeature.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ExploreFeature {

    @ObservableState
    struct State {
        var allAlbums: [Album] = []
        @Presents var albumPresented: AlbumFeature.State?
        @Presents var searchPresented: SearchFeature.State?
    }

    enum Action {
        // first fetch all albums
        case fetchAlbums

        // get and set response of [Album], response can be [Album], Error
        case albumsResponse(Result<[Album], Error>)

        // album can be tapped and move to next screen
        case albumPressed(Album)
        case albumPresented(PresentationAction<AlbumFeature.Action>)

        // search can be tapped and move to next screen
        case searchPressed
        case searchPresented(PresentationAction<SearchFeature.Action>)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            case .fetchAlbums:
                return .run { send in
                    do {
                        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://dummyjson.com/products")!)
                        let albumsArray = try JSONDecoder().decode(AlbumArray.self, from: data)

                        await send(.albumsResponse(.success(albumsArray.albums)))

                    } catch {
                        await send(.albumsResponse(.failure(error)))
                    }
                }

            case .albumsResponse(let result):
                switch result {
                case .success(let albums):
                    state.allAlbums = albums
                    return .none

                case .failure(let error):
                    print("Decoding Error: \(error.localizedDescription)")
                    return .none
                }

            case .albumPressed(let album):
                state.albumPresented = AlbumFeature.State(
                    selectedAlbum: album,
                    allTracks: state.allAlbums
                )
                return .none

            case .albumPresented(.dismiss):
                state.albumPresented = nil
                return .none

            case .albumPresented(.presented(_)):
                return .none

            case .searchPressed:
                state.searchPresented = SearchFeature.State(
                    allTracks: state.allAlbums
                )
                return .none

            case .searchPresented(.dismiss):
                return .none

            case .searchPresented(.presented(_)):
                return .none

            }
        }
        .ifLet(\.$albumPresented, action: \.albumPresented) {
            AlbumFeature()
        }
        .ifLet(\.$searchPresented, action: \.searchPresented) {
            SearchFeature()
        }
    }
}
