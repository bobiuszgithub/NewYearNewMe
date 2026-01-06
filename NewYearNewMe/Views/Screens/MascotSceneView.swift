//
//  MascotSceneView.swift
//  NewYearNewMe
//
//  Created by Bence Családi on 2026. 01. 05..
//

import SwiftUI
import SceneKit

struct MascotSceneView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.backgroundColor = .clear
        scnView.autoenablesDefaultLighting = false
        scnView.allowsCameraControl = false
        
        let scene = SCNScene()
        scnView.scene = scene
        
        //Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0.8, 2.0)
        scene.rootNode.addChildNode(cameraNode)
        
        //Lightning
        let ambientLight = SCNNode()
        ambientLight.light = SCNLight()
        ambientLight.light?.type = .ambient
        ambientLight.light?.intensity = 250
        scene.rootNode.addChildNode(ambientLight)
        
        let keyLight = SCNNode()
        keyLight.light = SCNLight()
        keyLight.light?.type = .directional
        keyLight.light?.intensity = 700
        keyLight.eulerAngles = SCNVector3(-Float.pi / 3, Float.pi / 4, 0)
        scene.rootNode.addChildNode(keyLight)
        
        //Mascot
        let mascotContainer = SCNNode()
        if let mascotScene = SCNScene(named: "ios.usdz") {
            for child in mascotScene.rootNode.childNodes {
                
                child.eulerAngles.x = -Float.pi / 2
                
                
                mascotContainer.addChildNode(child)
            }
        } else {
            print("⚠️ Could not load ios.usdz")
        }
        
        mascotContainer.scale = SCNVector3(0.5, 0.5, 0.5)
        mascotContainer.position = SCNVector3(0, 0, 0)
        scene.rootNode.addChildNode(mascotContainer)
        
        //Gestures
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        scnView.addGestureRecognizer(panGesture)
        context.coordinator.mascotNode = mascotContainer
        
        return scnView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {}
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        weak var mascotNode: SCNNode?
        private var lastY: Float = 0
        
        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            guard let node = mascotNode else { return }
            
            let translation = gesture.translation(in: gesture.view)
            let rotationAmount = Float(translation.x) * 0.01
            
            node.eulerAngles.y = lastY + rotationAmount
            
            if gesture.state == .ended || gesture.state == .cancelled {
                lastY = node.eulerAngles.y
            }
        }
    }
}

#Preview {
    MascotSceneView()
}
