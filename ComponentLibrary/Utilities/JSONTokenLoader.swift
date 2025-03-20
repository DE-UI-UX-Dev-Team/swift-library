//
//  JSONTokenLoader.swift
//  ComponentLibrary
//
//  Created by UI/UX Development on 3/19/25.
//

import Foundation
import os.log

struct JSONTokenLoader {
    static func load<T: Decodable>(fileName: String, type: T.Type) -> Result<T, Error> {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            os_log(.error, "File is not found", fileName)
            return .failure(NSError(domain: "JSONLoader", code: 404, userInfo: [NSLocalizedDescriptionKey: "\(fileName).json not found"]))
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            os_log(.info, "Successfully loaded JSON: %@", fileName)
            return .success(decodedData)
        } catch {
            os_log(.error, "Failed to decode %@.json: %@", fileName, error.localizedDescription)
            return .failure(error)
        }
    }
}
