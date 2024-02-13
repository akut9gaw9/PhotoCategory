//
//  PhotoCatalogServiceImplementation.swift
//  PhotoCatalog
//
//  Created by Stanislav on 12.02.2024.
//

import Foundation
import ServiceCore
import TCANetworkReducers
import HTTPTransport

// MARK: - PhotoCatalogServiceImplementation

public final class PhotoCatalogServiceImplementation: WebService {
    
    // MARK: - Initializers
    
    public init() {
        super.init(baseURL: URL(string: "https://vk.com").unsafelyUnwrapped, transport: HTTPTransport())
    }
    
    // MARK: - Mock
    
    private lazy var entities: [PhotoPlainObject] = {
        var result: [PhotoPlainObject] = []
        let entities: [PhotoPlainObject] = PhotoPlainObject.getPhotoCatalog()
        let count = entities.count * 10
        for i in 0..<count {
            let uniqueEntity = entities[i % entities.count]
            let newEntity = PhotoPlainObject(
                id: "\(i)",
                photoURL: uniqueEntity.photoURL
            )
            result.append(newEntity)
        }
        return result
    }()
}

// MARK: - PhotoCatalogService

extension PhotoCatalogServiceImplementation: PhotoCatalogService {
    
    public func obtainphotoCatalogPhotoCatalog(page: Int, pageSize: Int) -> ServiceCall<PaginatedResponsePlainObject<PhotoPlainObject>> {
        createCall { [entities = self.entities] in
                .success(
                    PaginatedResponsePlainObject(
                        pagination: PaginationMetadataPlainObject(
                            totalObjectCount: entities.count,
                            pageCount: entities.count / pageSize,
                            currentPage: page,
                            perPage: pageSize
                        ),
                        array: Array(
                            entities[0..<entities.count]
                        )
                    )
                )
        }
    }
}
