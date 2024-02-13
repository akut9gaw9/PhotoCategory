//
//  AppState.swift
//  PhotoCatalog
//
//  Created by Stanislav on 13.02.2024.
//

import Foundation

// MARK: - AppState

public struct AppState: Equatable {
    
    // MARK: - Properties
    
    public var selectedTab: Tabs = .photoCatalog
    
    // MARK: - Children
    
    public var photoCatalog = PhotoCatalogListState()
}
