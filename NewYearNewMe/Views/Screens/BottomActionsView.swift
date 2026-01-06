//
//  BottomActionsView.swift
//  NewYearNewMe
//
//  Created by Bence Családi on 2026. 01. 06..
//

import SwiftUI

struct BottomActionsView: View {
    var body: some View {
        HStack(spacing: 16) {
            ActionButton(title: "Pet Me", icon: "pawprint.fill")
            ActionButton(title: "Tell Me a Tip", icon: "lightbulb.fill")
            ActionButton(title: "Celebrate", icon: "sparkles")
            
        }
    }
}
struct ActionButton: View {
    let title: String
    let icon: String

    var body: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: icon)
                Text(title)
                    .font(.caption2)
            }
            .padding()
            .background(Color.brown.opacity(0.8))
            .cornerRadius(16)
            .foregroundColor(.white)
        }
    }
}


#Preview {
    BottomActionsView()
}
