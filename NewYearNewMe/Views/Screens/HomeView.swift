import SwiftUI

struct HomeView: View {
    @StateObject private var vm = ResolutionViewModel()
    @State private var newResolution = ""

    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            Spacer()
            BottomActionsView()
            MascotSceneView()
                .frame(height: 250)
                .background(Color(.systemBackground))

            Divider()

     
            List {
                ForEach(vm.resolutions) { resolution in
                    HStack {
                        Text(resolution.title)
                            .font(.body)

                        Spacer()

                        Image(systemName: resolution.isCompleted
                              ? "checkmark.circle.fill"
                              : "circle")
                            .foregroundColor(resolution.isCompleted ? .green : .gray)
                            .onTapGesture {
                                vm.toggle(resolution)
                            }
                    }
                }
                .onDelete(perform: vm.delete)
            }

            HStack {
                TextField("New resolution…", text: $newResolution)
                    .textFieldStyle(.roundedBorder)

                Button("Add") {
                    guard !newResolution.trimmingCharacters(in: .whitespaces).isEmpty else { return }
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

