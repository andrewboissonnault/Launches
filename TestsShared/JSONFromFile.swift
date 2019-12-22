//
//  JSONFromFile.swift
//  LaunchTests
//
//  Created by Andrew Boissonnault on 12/22/19.
//  Copyright © 2019 Andrew Boissonnault. All rights reserved.
//

import Foundation

enum JSONTestFile : String {
    case successResponse = "testResponse"
    case serializationError = "testSerializationError"
}

func dataFromJsonFile(filename : JSONTestFile) -> Data {
    if let path = pathWithFilename(filename : filename.rawValue) {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch {
            fatalError("Error reading json from bundle file.")
        }
    }
    fatalError("Error finding json bundle file.")
}

private func pathWithFilename(filename : String) -> String? {
    let bundles = Bundle.allBundles
    for bundle in bundles {
        if let path = bundle.path(forResource: filename, ofType: "json") {
            return path
        }
    }
    return nil
}
