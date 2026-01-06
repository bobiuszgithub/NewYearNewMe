import SwiftUI

struct HomeView: View {
    @StateObject private var vm = ResolutionViewModel()
    @State private var newResolution = ""

    var body: some View {
        VStack {
            List {
                ForEach(vm.resolutions) { res in
                    HStack {
                        Text(res.title)
                        Spacer()
                        Image(systemName: res.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                vm.toggle(res)
                            }
                    }
                }
            }

            HStack {
                TextField("New resolution…", text: $newResolution)
                    .textFieldStyle(.roundedBorder)

                Button("Add") {
                    guard !newResolution.isEmpty else { return }
                    vm.add(newResolution)
                    newResolution = ""
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
