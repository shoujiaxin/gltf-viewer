//
//  ModelView.swift
//  glTFViewer
//
//  Created by Jiaxin Shou on 2021/8/5.
//

import SceneKit
import SwiftUI

struct ModelView: View {
    @Environment(\.colorScheme) private var colorScheme

    @ObservedObject private var loader: ModelLoader

    init(url: URL?) {
        _loader = ObservedObject(wrappedValue: ModelLoader(url: url))
    }

    var body: some View {
        if loader.isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        } else {
            SceneView(scene: scene(), pointOfView: nil, options: [.allowsCameraControl, .autoenablesDefaultLighting], preferredFramesPerSecond: 60, antialiasingMode: .multisampling16X, delegate: nil, technique: nil)
        }
    }

    func scene() -> SCNScene? {
        guard let scene = loader.scene else {
            return nil
        }

        scene.background.contents = colorScheme == .dark ? NSColor.windowBackgroundColor : NSColor.white
        return scene
    }
}

struct ModelView_Previews: PreviewProvider {
    static var previews: some View {
        ModelView(url: URL(fileURLWithPath: "Preview Scenes.scnassets/PrimaryIonDrive.glb", relativeTo: Bundle.main.resourceURL))
            .frame(width: 500, height: 500)
    }
}
