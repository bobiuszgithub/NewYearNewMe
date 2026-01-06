//
//  Resolution.swift
//  NewYearNewMe
//
//  Created by Bence Családi on 2026. 01. 05..
//

import Foundation

struct Resolution : Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    let createdAt: Date
}
