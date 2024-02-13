//
//  PhotoCatalogListView.swift
//  TCATemplate
//
//  Created by Dmitry Savinov on 19.10.2023.
//  Copyright © 2023 Incetro Inc. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import TCANetworkReducers

// MARK: - PhotoCatalogListView

public struct PhotoCatalogListView: View {
    
    // MARK: - Properties
    
    /// The store powering the `PhotoCatalogList` reducer
    public let store: StoreOf<PhotoCatalogListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: 0),
                            GridItem(.flexible(), spacing: 0),
                        ]
                    ) {
                        ForEachStore(
                            store.scope(
                                state: \.photoCatalogItems,
                                action: PhotoCatalogListAction.photoCatalogItem(id:action:)
                            ),
                            content: PhotoCatalogItemView.init
                        )
                    }
                    PaginationView(
                        store: store.scope(
                            state: \.photoCatalogListPagination,
                            action: PhotoCatalogListAction.photoCatalogListPagination
                        ),
                        loader: {
                            ProgressView()
                        }
                    )
                }
            }
        }
    }
}

// MARK: - Preview

//#Preview {
//    PhotoCatalogListView(
//        store: Store(
//            initialState: PhotoCatalogListState(),
//            reducer: PhotoCatalogListReducer(
//                photoCatalogService: PhotoCatalogServiceImplementation()
//            )
//        )
//    )
//}
