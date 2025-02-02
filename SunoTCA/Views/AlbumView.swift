//
//  AlbumView.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import SwiftUI
import ComposableArchitecture

struct AlbumView: View {

    let store: StoreOf<AlbumFeature>
    @Environment(\.dismiss) var dismiss

    var body: some View {

        let selectedAlbum = store.selectedAlbum

        ZStack (alignment: .topLeading){
            VStack {
                ScrollView {
                    AlbumHeaderView(albumImage: selectedAlbum.firstImage, albumImageHeight: 300, albumTitle: selectedAlbum.title)
                    
                    VStack {
                        ForEach(store.allTracks) { track in
                            if let arteest = selectedAlbum.artist {
                                TracksListView(
                                    trackImage: track.firstImage,
                                    trackTitle: track.title,
                                    trackCategory: track.tags,
                                    trackArtist: arteest,
                                    trackListens: track.id,
                                    trackLikes: track.id
                                ) {
                                    store.send(.trackPressed(track))
                                }
                            }
                        }
                    }
                }
            }
            
            Button{
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
            }
            .padding(.leading, 10)
            .font(.title)
            .foregroundStyle(.black)
        }
        .fullScreenCover(store: store.scope(state: \.$trackPresented, action: \.trackPresented)) { trackStore in

            NavigationStack {
                TrackView(store: trackStore)
            }
        }
    }
}

#Preview {
    AlbumView(
        store: Store(
            initialState: AlbumFeature.State(
                selectedAlbum: Album(
                    id: 155,
                    title: "Wildflower",
                    description: "Ghost",
                    category: "Pop",
                    rating: 5,
                    tags: ["good", "awesome"],
                    albumCover: [Constants.randomImage],
                    artist: "Billie Eilish"
                ), allTracks: [Album(
                    id: 155,
                    title: "Wildflower",
                    description: "Ghost",
                    category: "Pop",
                    rating: 5,
                    tags: ["good", "awesome"],
                    albumCover: [Constants.randomImage],
                    artist: "Billie Eilish"
                ), Album(
                    id: 155,
                    title: "Wildflower",
                    description: "Ghost",
                    category: "Pop",
                    rating: 5,
                    tags: ["good", "awesome"],
                    albumCover: [Constants.randomImage],
                    artist: "Billie Eilish"
                ), Album(
                    id: 155,
                    title: "Wildflower",
                    description: "Ghost",
                    category: "Pop",
                    rating: 5,
                    tags: ["good", "awesome"],
                    albumCover: [Constants.randomImage],
                    artist: "Billie Eilish"
                ), Album(
                    id: 155,
                    title: "Wildflower",
                    description: "Ghost",
                    category: "Pop",
                    rating: 5,
                    tags: ["good", "awesome"],
                    albumCover: [Constants.randomImage],
                    artist: "Billie Eilish"
                )]
            ),
            reducer: {
                AlbumFeature()
            })
    )
}
