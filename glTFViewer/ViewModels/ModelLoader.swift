//
//  ModelLoader.swift
//  glTFViewer
//
//  Created by Jiaxin Shou on 2021/8/5.
//

import Foundation
import GLTFSceneKit
import SceneKit

class ModelLoader: ObservableObject {
    @Published private(set) var scene: SCNScene?

    @Published private(set) var isLoading: Bool = false

    private let url: URL?

    init(url: URL?) {
        self.url = url

        load()
    }

    private func load() {
        guard let url = self.url else {
            return
        }

        isLoading = true
        DispatchQueue.global(qos: .userInitiated).async {
            let scene: SCNScene
            do {
                let source = GLTFSceneSource(url: url)
                scene = try source.scene()
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    print(error.localizedDescription)
                }
                return
            }

            DispatchQueue.main.async {
                self.isLoading = false
                self.scene = scene
            }
        }
    }
}
