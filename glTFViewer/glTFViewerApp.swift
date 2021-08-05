//
//  glTFViewerApp.swift
//  glTFViewer
//
//  Created by Jiaxin Shou on 2021/8/4.
//

import SwiftUI

@main
struct glTFViewerApp: App {
    var body: some Scene {
        DocumentGroup(viewing: ModelDocument.self) { file in
            ModelView(url: file.fileURL)
                .frame(minWidth: minWindowWidth, minHeight: minWindowHeight)
                .toolbar {
                    Button(action: {}) {
                        Image(systemName: "gearshape")
                    }
                }
        }
    }

    // MARK: - Constants

    private let minWindowWidth: CGFloat = 480
    private let minWindowHeight: CGFloat = 360
}
