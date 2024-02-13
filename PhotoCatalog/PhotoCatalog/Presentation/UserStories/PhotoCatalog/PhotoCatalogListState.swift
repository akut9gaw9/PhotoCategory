//
//  PhotoCatalogListState.swift
//  TCATemplate
//
//  Created by Dmitry Savinov on 19.10.2023.
//  Copyright © 2023 Incetro Inc. All rights reserved.
//

import Foundation
import ComposableArchitecture
import TCANetworkReducers

// MARK: - PhotoCatalogListState

public struct PhotoCatalogListState: Equatable {
    
    // MARK: - Properties
    
    // MARK: - Children
    
    /// Identified array of `PhotoCatalogItemState`
    ///
    /// It's represents children of `PhotoCatalogItemState` module.
    /// We use it here to integrate `PhotoCatalogItemState` array logic inside current module.
    /// If you change the state inside one of the `PhotoCatalogItemState` module items then all changes will be saved here.
    public var photoCatalogItems: IdentifiedArrayOf<PhotoCatalogItemState>
    
    // MARK: - Pagination
    
    /// PaginationState instance
    public var photoCatalogListPagination: PaginationState<PhotoPlainObject>
}

// MARK: - Initializers

extension PhotoCatalogListState {
 
    public init() {
        self.photoCatalogListPagination = PaginationState(pageSize: 30)
        self.photoCatalogItems = []
    }
}
