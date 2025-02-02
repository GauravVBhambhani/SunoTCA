//
//  ExploreView.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import SwiftUI
import ComposableArchitecture

struct ExploreView: View {

    let store: StoreOf<ExploreFeature>

    var body: some View {
        VStack {
            HStack {
                Text("Explore")
                    .font(.title)
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    print("opening search view")
                    store.send(.searchPressed)
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
            .padding()

            Spacer()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .top){
                    ForEach(store.allAlbums) { album in
                        AlbumButtonView (
                            albumImage: album.firstImage,
                            albumTitle: album.title,
                            albumSubtitle: album.category) {
                                store.send(.albumPressed(album))
                            }
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .task {
            store.send(.fetchAlbums)
        }
        .toolbar(.hidden)
        .fullScreenCover(store: store.scope(state: \.$albumPresented, action: \.albumPresented)) { albumStore in
            NavigationStack {
                AlbumView(store: albumStore)
            }
        }
        .fullScreenCover(store: store.scope(state: \.$searchPresented, action: \.searchPresented)) { searchStore in
            NavigationStack {
                SearchView(store: searchStore)
            }
        }
    }
}

#Preview {
    ExploreView(
        store: Store(
            initialState: ExploreFeature.State(),
            reducer: {
                ExploreFeature()
            }
        )
    )
}
