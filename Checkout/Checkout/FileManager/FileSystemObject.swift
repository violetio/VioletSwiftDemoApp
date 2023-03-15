//
//  FileSystemObject.swift
//  Checkout
//
//  Created by Alan Morford on 3/8/23.
//

import Foundation

public class FileSystemObject {
    public enum SystemObjectType {
        case file
        case directory
    }

    public let objectType: SystemObjectType
    public let objectURL: URL

    public init(url: URL, type: SystemObjectType) {
        self.objectURL = url
        self.objectType = type
    }

    public static func pathExists(_ url: URL) -> SystemObjectType? {
        var isDir: ObjCBool = ObjCBool(false)
        guard FileManager.default.fileExists(atPath: url.path, isDirectory: &isDir) else { return nil }
        return isDir.boolValue ? SystemObjectType.directory : SystemObjectType.file
    }

    public static func objectTypeUnknown( url: URL) -> FileSystemObject? {
        guard let knownType = pathExists(url) else {
            return nil
        }
        return FileSystemObject(url: url, type: knownType)
    }
}
