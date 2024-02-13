//
//  PhotoCatalogItemReducer.swift
//  TCATemplate
//
//  Created by Dmitry Savinov on 19.10.2023.
//  Copyright © 2023 Incetro Inc. All rights reserved.
//

import ComposableArchitecture

// MARK: - PhotoCatalogItemReducer

public struct PhotoCatalogItemReducer: Reducer {
    
    // MARK: - Feature
    
    public var body: some Reducer<PhotoCatalogItemState, PhotoCatalogItemAction> {
        Reduce { state, action in
            switch action {
            default:
                break
            }
            return .none
        }
    }
}
