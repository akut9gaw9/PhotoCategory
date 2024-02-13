//
//  AppView.swift
//  PhotoCatalog
//
//  Created by Stanislav on 13.02.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - AppView

public struct AppView: View {
    
    // MARK: - Properties
    
    public let store: StoreOf<AppReducer>
    
    // MARK: - View
    
    public var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    PhotoCatalogListView(
                        store: store.scope(
                            state: \.photoCatalog,
                            action: AppAction.photoCatalog
                        )
                    )
                    .navigationTitle(Tabs.photoCatalog.title).foregroundColor(.white)
                    .navigationBarHidden(false)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .navigationViewStyle(.stack)
                .tag(Tabs.photoCatalog)
                .tabItem {
                    Image(systemName: Tabs.photoCatalog.imageString)
                        .renderingMode(.template)
                    Text(Tabs.photoCatalog.title)
                }
            }
        }
    }
}
