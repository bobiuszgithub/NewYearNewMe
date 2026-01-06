//
//  HeaderView.swift
//  NewYearNewMe
//
//  Created by Bence Családi on 2026. 01. 06..
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button("Edit") {}

            Spacer()

            Text("New Year, New Me")
                .font(.title2)
                .fontWeight(.bold)

            Spacer()

            Button {
            } label: {
                Image(systemName: "gearshape.fill")
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    HeaderView()
}
