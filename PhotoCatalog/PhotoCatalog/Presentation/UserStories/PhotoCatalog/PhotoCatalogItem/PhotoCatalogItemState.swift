//
//  PhotoCatalogItemState.swift
//  TCATemplate
//
//  Created by Dmitry Savinov on 19.10.2023.
//  Copyright © 2023 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - PhotoCatalogItemState

public struct PhotoCatalogItemState: Equatable, Identifiable {
    
    // MARK: - Properties
    
    public let id: String
    
    public let photoURL: URL
}

// MARK: - Initailizers

extension PhotoCatalogItemState {
    
    public init(photo: PhotoPlainObject) {
        self.id = photo.id
        self.photoURL = photo.photoURL
    }
    public init() {
        self.id = "\(Int.random(in: 0...999))"
        self.photoURL = URL(string: "https://avatars.mds.yandex.net/i?id=a5bce281427bcb78d03f4d8b9c9892e396c02696-5105957-images-thumbs&n=13").unsafelyUnwrapped
    }
}
