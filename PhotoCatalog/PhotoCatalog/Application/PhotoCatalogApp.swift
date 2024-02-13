//
//  PhotoCatalogApp.swift
//  PhotoCatalog
//
//  Created by Stanislav on 12.02.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct PhotoCatalogApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

// MARK: - MainView

public struct MainView: View {
    
    // MARK: - View
    
    public var body: some View {
        AppView(
            store: Store(
                initialState: AppState(),
                reducer: AppReducer()
            )
        )
    }
}
