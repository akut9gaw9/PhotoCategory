//
//  PhotoCatalogItemView.swift
//  TCATemplate
//
//  Created by Dmitry Savinov on 19.10.2023.
//  Copyright © 2023 Incetro Inc. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import Kingfisher

// MARK: - PhotoCatalogItemView

public struct PhotoCatalogItemView: View {
    
    // MARK: - Properties
    
    /// The store powering the `PhotoCatalogItem` reducer
    public let store: StoreOf<PhotoCatalogItemReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                KFImage(viewStore.photoURL)
                    .resizable()
                    .frame(height: 200)
                    .clipShape(.rect(cornerRadius: 16))
                VStack(spacing: 0) {
                    Spacer()
                    HStack(spacing: 0) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundColor(.white)
                            .padding([.bottom, .trailing], 8)
                            .onTapGesture {
                                viewStore.send(.heartTap)
                            }
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
    }
}

// MARK: - Preview

private struct PhotoCatalogItem_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCatalogItemView(
            store: Store(
                initialState: PhotoCatalogItemState(),
                reducer: PhotoCatalogItemReducer()
            )
        )
    }
}
