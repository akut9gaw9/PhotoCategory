//
//  Tabs.swift
//  PhotoCatalog
//
//  Created by Stanislav on 13.02.2024.
//

import SwiftUI

// MARK: - Tabs

public enum Tabs: Equatable {
    
    // MARK: - Cases
    
    case photoCatalog
    
    // MARK: - Useful
    
    var title: LocalizedStringKey {
        switch self {
        case .photoCatalog:
            "Избранное"
        }
    }
    
    var imageString: String {
        switch self {
        case .photoCatalog:
            "heart.fill"
        }
    }
}
