//
//  PreviewViewController.swift
//  PreviewExtension
//
//  Created by Jiaxin Shou on 2021/8/6.
//

import Cocoa
import GLTFSceneKit
import Quartz
import SceneKit

class PreviewViewController: NSViewController, QLPreviewingController {
    @IBOutlet var sceneView: SCNView!

    override var nibName: NSNib.Name? {
        return NSNib.Name("PreviewViewController")
    }

    override func loadView() {
        super.loadView()

        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .clear
    }

    func preparePreviewOfFile(at url: URL, completionHandler handler: @escaping (Error?) -> Void) {
        let scene: SCNScene
        do {
            let source = GLTFSceneSource(url: url)
            scene = try source.scene()
        } catch {
            handler(error)
            return
        }

        sceneView.scene = scene
        handler(nil)
    }
}
