//
//  PhotoCatalogListReducer.swift
//  TCATemplate
//
//  Created by Dmitry Savinov on 19.10.2023.
//  Copyright © 2023 Incetro Inc. All rights reserved.
//

import ComposableArchitecture
import TCANetworkReducers
import Combine


// MARK: - PhotoCatalogListReducer

public struct PhotoCatalogListReducer: Reducer {
    
    public let photoCatalogService: PhotoCatalogService = PhotoCatalogServiceImplementation()
    
    // MARK: - Feature
    
    public var body: some Reducer<PhotoCatalogListState, PhotoCatalogListAction> {
        Scope(state: \.photoCatalogListPagination, action: /PhotoCatalogListAction.photoCatalogListPagination) {
            PaginationReducer { page, pageSize in
                photoCatalogService
                    .obtainphotoCatalogPhotoCatalog(page: page, pageSize: pageSize)
                    .publish()
            }
        }
        Reduce { state, action in
            switch action {
            case .photoCatalogListPagination(.response(.success(let data))):
                state.photoCatalogItems += IdentifiedArray(uniqueElements: data.array.map(PhotoCatalogItemState.init))
            case .photoCatalogListPagination(.response(.failure(let error))):
                print(error)
            case .photoCatalogItem(id: let id, action: .heartTap):
                print("Нажали")
                state.photoCatalogItems.remove(id: id)
            default:
                break
            }
            return .none
        }
        .forEach(\.photoCatalogItems, action: /PhotoCatalogListAction.photoCatalogItem(id:action:)) {
            PhotoCatalogItemReducer()
        }
    }
}
