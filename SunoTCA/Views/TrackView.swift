//
//  TrackView.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import SwiftUI
import ComposableArchitecture

struct TrackView: View {

    let store: StoreOf<TrackFeature>

    @Environment(\.dismiss) var dismiss

    var body: some View {

        ZStack(alignment: .topLeading) {

            if let selectedTrack = store.selectedTrack {
                ImageLoader(urlString: selectedTrack.firstImage)
                    .ignoresSafeArea()
            } else {
                ImageLoader()
                    .ignoresSafeArea()
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
    }
}

#Preview {
    TrackView(store: Store(initialState: TrackFeature.State(), reducer: {
        TrackFeature()
    }))
}
