//
//  PhotoCatalogListAction.swift
//  TCATemplate
//
//  Created by Dmitry Savinov on 19.10.2023.
//  Copyright © 2023 Incetro Inc. All rights reserved.
//

import Foundation
import TCANetworkReducers

// MARK: - PhotoCatalogListAction

public enum PhotoCatalogListAction: Equatable {
    
    // MARK: - Cases
    
    /// General action that calls when view appears
    case onAppear
    
    /// General action that calls when view disappears
    case onDisappear
    
    // MARK: - Children
    
    /// Child action for `PhotoCatalogItem` module.
    ///
    /// It's necessary as we use `ForEach` scope operator in current module's reducer.
    /// In short, the `photoCatalogItem` case means that every action in `PhotoCatalogItem` module
    /// will be sent to current module with target element identifier
    case photoCatalogItem(id: PhotoCatalogItemState.ID, action: PhotoCatalogItemAction)
    
    // MARK: - Pagination
    
    case photoCatalogListPagination(PaginationAction<PhotoPlainObject, PhotoCatalogServiceError>)
    
    // MARK: - Services
    
    case photoCatalogService(Result<PhotoCatalogServiceAction, PhotoCatalogServiceError>)
}
