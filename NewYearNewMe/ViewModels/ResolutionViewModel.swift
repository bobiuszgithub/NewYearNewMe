//
//  ResolutionViewModel.swift
//  NewYearNewMe
//
//  Created by Bence Családi on 2026. 01. 05..
//

import Foundation

@MainActor
final class ResolutionViewModel: ObservableObject {
    @Published var resolutions: [Resolution] = []

    private let store = ResolutionStore()

    init() {
        resolutions = store.load()
    }

    func add(_ title: String) {
        let new = Resolution(
            id: UUID(),
            title: title,
            isCompleted: false,
            createdAt: Date()
        )
        resolutions.append(new)
        store.save(resolutions)
    }

    func toggle(_ resolution: Resolution) {
        guard let index = resolutions.firstIndex(where: { $0.id == resolution.id }) else { return }
        resolutions[index].isCompleted.toggle()
        store.save(resolutions)
    }
}
