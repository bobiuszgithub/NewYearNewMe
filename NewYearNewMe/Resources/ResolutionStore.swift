//
//  ResolutionStore.swift
//  NewYearNewMe
//
//  Created by Bence Családi on 2026. 01. 05..
//

import Foundation

final class ResolutionStore {
    private let key = "resolutions"

    func load() -> [Resolution] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let resolutions = try? JSONDecoder().decode([Resolution].self, from: data)
        else {
            return []
        }
        return resolutions
    }

    func save(_ resolutions: [Resolution]) {
        guard let data = try? JSONEncoder().encode(resolutions) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}
