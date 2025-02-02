//
//  SearchView.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {

    @Bindable var store: StoreOf<SearchFeature>
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                TextField(
                    "Search",
                    text: $store.searchedText.sending(\.updateSearchText)
                )
                .padding()

                let filteredTracks = store.filteredTracks

                if !filteredTracks.isEmpty {
                    ScrollView {
                        ForEach(filteredTracks) { track in
                            TracksListView(
                                trackImage: track.firstImage,
                                trackTitle: track.title,
                                trackCategory: track.tags,
                                trackArtist: track.artist ?? "Artist",
                                trackListens: track.id,
                                trackLikes: track.id) {
                                    store.send(.trackPressed(track))
                                }
                        }
                    }
                } else {
                    Text("Nothing found")
                }
            }
            .padding(.top, 16)

            Button{
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
            }
            .padding(.leading, 10)
            .font(.title)
            .foregroundStyle(.black)
        }
        .fullScreenCover(store: store.scope(state: \.$trackPresentedFromSearch, action: \.trackPresentedFromSearch)) { trackStore in
            NavigationStack {
                TrackView(store: trackStore)
            }
        }
    }
}

#Preview {
    SearchView(
        store: Store(
            initialState: SearchFeature
                .State(
                    selectedTrack: Album(
                        id: 1234,
                        title: "Song",
                        description: "Desc",
                        category: "Cateory",
                        rating: 1.2,
                        tags: ["tag1", "tag2"],
                        albumCover: [Constants.randomImage],
                        artist: "Artist"
                    )
                ),
            reducer: {
                SearchFeature()
            })
    )
}
