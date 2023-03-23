//
//  FileDirectory.swift
//  Checkout
//
//  Created by Alan Morford on 3/8/23.
//

import Foundation

/// FileDirectory provides a Representation of a Directory on disk providing simplified access to common Directory tasks: checking the Path Exists, Creating that path, Deleting that path - all the common tasks taking more code to accomplish via FileManager APIs, all in addition to keeping the String and URL path ready for immediate use.
public class FileDirectory {

    public let directoryURL: URL

    public init(url: URL) {
        self.directoryURL = url
    }

    public convenience init(path: String) {
        self.init(url: URL(fileURLWithPath: path))
    }
}

extension FileDirectory {

    public var directoryPath: String { return directoryURL.path }

    public var directoryName: String { return directoryURL.lastPathComponent }

    public func pathExists() -> Bool {
        return FileSystemObject.pathExists(directoryURL) == FileSystemObject.SystemObjectType.directory
    }

    public func childDirectory(name: String) -> FileDirectory {
        let childDirectoryUrl = self.directoryURL.appendingPathComponent(name, isDirectory: true)
        return FileDirectory(url: childDirectoryUrl)
    }

    @discardableResult
    public func createDirectory(withIntermediateDirectories: Bool = true) -> Bool {
        guard !self.pathExists() else {
            return true
        }
        let fm = FileManager.default
        let didCreate: Bool = ((try? fm.createDirectory(atPath: self.directoryPath, withIntermediateDirectories: withIntermediateDirectories)) != nil)
        return didCreate
    }

    @discardableResult
    public func deleteDirectory() -> Bool {
        guard self.pathExists() else {
            return false
        }
        let fm = FileManager.default
        let didRemove: Bool = ((try? fm.removeItem(at: self.directoryURL)) != nil)
        return didRemove
    }

    public func fileSystemObjects() -> [FileSystemObject]? {
        guard self.pathExists() else {
            return nil
        }
        let fm = FileManager.default
        guard let contentNames = try? fm.contentsOfDirectory(atPath: self.directoryPath) else {
            return nil
        }

        let contentURLs = contentNames.map { self.directoryURL.appendingPathComponent($0) }
        return contentURLs.compactMap(FileSystemObject.objectTypeUnknown(url:))
    }

    public func contents() -> [FilePath]? {
        guard let fileSystemObjects = self.fileSystemObjects() else {
            return nil
        }

        let fileObjects = fileSystemObjects.filter { $0.objectType == FileSystemObject.SystemObjectType.file }
        let contents: [FilePath] = fileObjects.compactMap { FilePath(url: $0.objectURL, fileDirectory: self) }
        return contents
    }

    public func contentsWithExtension(ext: String) -> [FilePath]? {
        return contents()?.filter { $0.fileName.hasSuffix(ext) }
    }

    public func subDirectories() -> [FileDirectory]? {
        guard let fileSystemObjects = self.fileSystemObjects() else {
            return nil
        }

        let fileObjects = fileSystemObjects.filter { $0.objectType == FileSystemObject.SystemObjectType.directory }
        let subDirectories: [FileDirectory] = fileObjects.map { FileDirectory(url: $0.objectURL) }
        return subDirectories
    }

    public enum CommonFileDirectoryType {
        case Documents
        case Caches
    }

    public static func CommonFileDirectoryPath(type: CommonFileDirectoryType) -> String {
        switch type {
        case .Documents:
            return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        case .Caches:
            return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        }
    }

    public static func CommonFileDirectory(type: CommonFileDirectoryType) -> FileDirectory {
        let stringPath = CommonFileDirectoryPath(type: type)
        let urlPath = URL(fileURLWithPath: stringPath)
        return FileDirectory(url: urlPath)
    }

    public static func DocumentsFileDirectory() -> FileDirectory {
        return CommonFileDirectory( type: .Documents)
    }

    public static func CachesFileDirectory() -> FileDirectory {
        return CommonFileDirectory( type: .Caches)
    }
}
