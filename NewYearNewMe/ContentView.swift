import SwiftUI
import SceneKit

struct ContentView: View {
    var scene: SCNScene {
        let scene = SCNScene(named: "art.scnassets/ios.usdz")!
        if let modelNode = scene.rootNode.childNodes.first {
                   modelNode.eulerAngles.x = -.pi / 2  // rotate 90° so front faces camera
               }

               // CAMERA
               let cameraNode = SCNNode()
               cameraNode.camera = SCNCamera()
               cameraNode.position = SCNVector3(0, 0, 5)
               cameraNode.look(at: SCNVector3(0, 0, 0))
               scene.rootNode.addChildNode(cameraNode)

        let light = SCNLight()
        light.type = .omni // or .directional, .spot
        light.intensity = 500 // default is 1000, try lowering it
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(0, 10, 10)
        scene.rootNode.addChildNode(lightNode)

        return scene
    }

    var body: some View {
        SceneView(
            scene: scene,
            options: [
                .allowsCameraControl,
                .autoenablesDefaultLighting
            ]
        )
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
