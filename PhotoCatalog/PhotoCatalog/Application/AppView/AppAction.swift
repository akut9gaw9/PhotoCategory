//
//  AppAction.swift
//  PhotoCatalog
//
//  Created by Stanislav on 13.02.2024.
//

import Foundation

// MARK: - AppAction

public enum AppAction: Equatable {
    
    // MARK: - Cases
    
    case onAppear
    
    case photoCatalog(PhotoCatalogListAction)
}
