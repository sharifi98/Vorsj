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
        return decode(data: cachedData, filename: filename)
    }

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    guard let data = try? Data(contentsOf: file) else {
        fatalError("Couldn't load \(filename) from main bundle.")
    }

    // Cache the loaded data
    dataCache[filename] = data

    return decode(data: data, filename: filename)
}

func decode<T: Decodable>(data: Data, filename: String) -> T {
    let decoder = JSONDecoder()
    do {
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
