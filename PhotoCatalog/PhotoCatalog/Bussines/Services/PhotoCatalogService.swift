//
//  PhotoCatalogService.swift
//  PhotoCatalog
//
//  Created by Stanislav on 12.02.2024.
//

import Foundation
import ServiceCore
import TCANetworkReducers

public enum PhotoCatalogServiceAction: Equatable {
    
    // MARK: - Cases
    
    case obtainedPhotoCatalog([PhotoPlainObject])
}

// MARK: - DistrictServiceError

public typealias PhotoCatalogServiceError = NSError

// MARK: - PhotoCatalogService

public protocol PhotoCatalogService {
    
    func obtainphotoCatalogPhotoCatalog(page: Int,
                                    pageSize: Int
    ) -> ServiceCall<PaginatedResponsePlainObject<PhotoPlainObject>>
}
