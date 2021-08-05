//
//  ModelDocument.swift
//  glTFViewer
//
//  Created by Jiaxin Shou on 2021/8/5.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var glb: UTType {
        UTType(importedAs: "public.glb")
    }

    static var gltf: UTType {
        UTType(importedAs: "public.gltf")
    }
}

struct ModelDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.glb, .gltf] }

    init(configuration _: ReadConfiguration) throws {}

    func fileWrapper(configuration _: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper()
    }
}
