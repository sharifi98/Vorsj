//
//  ModelData.swift
//  Vorsj
//
//  Created by Hossein Sharifi on 15/08/2023.
//

import Foundation

var dataCache: [String: Data] = [:]


func load<T: Decodable>(_ filename: String) -> T {
    // If data is already cached, decode and return it
    if let cachedData = dataCache[filename] {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: cachedData)
        } catch {
            fatalError("Couldn't parse \(filename) from cache as \(T.self):\n\(error)")
        }
    }

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    // Cache the loaded data
    dataCache[filename] = data

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
