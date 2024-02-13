//
//  AppReducer.swift
//  PhotoCatalog
//
//  Created by Stanislav on 13.02.2024.
//

import Combine
import Foundation
import HTTPTransport
import ComposableArchitecture

// MARK: - AppReducer

public struct AppReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<AppState, AppAction> {
        Scope(state: \.photoCatalog, action: /AppAction.photoCatalog) {
            PhotoCatalogListReducer()
        }
        EmptyReducer()
    }
}
