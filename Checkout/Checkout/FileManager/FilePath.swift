//
//  FilePath.swift
//  Checkout
//
//  Created by Alan Morford on 3/8/23.
//

import Foundation

public class FilePath {
    public let fileName: String
    public let fileURL: URL
    public let fileDirectory: FileDirectory

    /// Initialize a FilePath to represent a FileName within a FileDirectory
    ///
    /// - Parameters:
    ///   - url: Must be the full correct URL to the file - Full path with filename
    ///   - fileDirectory: FileDirectory containing
    public init?(url: URL, fileDirectory: FileDirectory) {
        guard url.deletingLastPathComponent() == fileDirectory.directoryURL else {
            return nil
        }
        self.fileURL = url
        self.fileName = url.lastPathComponent
        self.fileDirectory = fileDirectory
    }

    public convenience init?(fileName: String, fileDirectory: FileDirectory) {
        let fileURL = fileDirectory.directoryURL.appendingPathComponent(fileName)
        self.init(url: fileURL, fileDirectory: fileDirectory)
    }

    public convenience init?(filePath: String) {
        let fileURL = URL(fileURLWithPath: filePath)
        let lastComponent = fileURL.lastPathComponent
        let directoryURL = fileURL.deletingLastPathComponent()
        let fileDirectory = FileDirectory(url: directoryURL)
        self.init(fileName: lastComponent, fileDirectory: fileDirectory)
    }
}

extension FilePath {
    public var filePath: String { return fileURL.path }

    public func fileExists() -> Bool {
        return FileSystemObject.pathExists(fileURL) == FileSystemObject.SystemObjectType.file
    }

    public enum FilePathCopyError: Error {
        case fileExists
        case pathExists
        case copyDestination
        case targetFilePath
        case copyItem(Error)
    }

    typealias CatchingClosure = (() throws -> FilePath)
    public func fileCopyOut(to fileDirectory: FileDirectory) -> Result<FilePath, Error> {
        let closure: CatchingClosure = {
            guard self.fileExists() else {
                throw FilePathCopyError.fileExists
            }
            guard fileDirectory.pathExists() else {
                throw FilePathCopyError.pathExists
            }
            guard fileDirectory.directoryURL != self.fileDirectory.directoryURL else {
                throw FilePathCopyError.copyDestination
            }
            guard let targetFilePath = FilePath(fileName: self.fileName, fileDirectory: fileDirectory) else {
                throw FilePathCopyError.targetFilePath
            }
            do {
                try FileManager.default.copyItem(at: self.fileURL, to: targetFilePath.fileURL)
                return targetFilePath
            } catch {
                throw FilePathCopyError.copyItem(error)
            }

        }
        return Result<FilePath, Error>(catching: closure)
    }

    public func fileCopyIn(from filePathIn: FilePath, overwrite: Bool) -> Result<FilePath, Error> {
        let closure: CatchingClosure = {
            guard filePathIn.fileExists() else {
                throw FilePathCopyError.fileExists
            }
            if !overwrite { //If no overwrite
                guard !self.fileExists() else { //Then enforce file cannot already exist
                    throw FilePathCopyError.copyDestination
                }
            }
            do {
                try FileManager.default.copyItem(at: filePathIn.fileURL, to: self.fileURL)
                return self
            } catch {
                throw FilePathCopyError.copyItem(error)
            }
        }
        return Result<FilePath, Error>(catching: closure)
    }
}

extension FilePath: Equatable {
    public static func == (lhs: FilePath, rhs: FilePath) -> Bool {
        return lhs.fileURL == rhs.fileURL
    }
}
