//
//  PhotoPlainObject.swift
//  PhotoCatalog
//
//  Created by Stanislav on 13.02.2024.
//

import Foundation

// MARK: - PhotoPlainObject

public struct PhotoPlainObject: Codable, Equatable, Identifiable {
    
    // MARK: - Properties
    
    public let id: String
    
    public let photoURL: URL
}

// MARK: - Mock

extension PhotoPlainObject {
    
    static func getPhotoCatalog() -> [PhotoPlainObject] {
        [
            PhotoPlainObject(
                id: "1",
                photoURL: URL(string: "https://avatars.mds.yandex.net/i?id=a5bce281427bcb78d03f4d8b9c9892e396c02696-5105957-images-thumbs&n=13").unsafelyUnwrapped
            ),
            PhotoPlainObject(
                id: "2",
                photoURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/09/POL_2007_08_04_Jaroslawiec_zachodniopomorskie_02.JPG").unsafelyUnwrapped
            ),
            PhotoPlainObject(
                id: "3",
                photoURL: URL(string: "https://www.rgo.ru/sites/default/files/node/69160/photo-2023-10-30-123106.jpeg").unsafelyUnwrapped
            ),
        ]
    }
}
