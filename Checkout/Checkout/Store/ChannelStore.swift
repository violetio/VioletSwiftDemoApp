//
//  ChannelStore.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import Foundation
import VioletPublicClientAPI

class ChannelStore {
    
    static let ChannelStoreDirectory: FileDirectory = {
        let channelStoreDirectory = FileDirectory.CachesFileDirectory().childDirectory(name: "ChannelStore")
        channelStoreDirectory.createDirectory()
        return channelStoreDirectory
    }()
    
    static func ChannelIDStoreDirectory(appId: Int64) -> FileDirectory {
        Self.ChannelStoreDirectory.childDirectory(name: String(appId))
    }
    
    static func ChannelIDStoredEntityFilePath(appId: Int64, cacheFileName: CacheFileNames) -> FilePath? {
        return FilePath(fileName: cacheFileName.rawValue, fileDirectory: self.ChannelIDStoreDirectory(appId: appId))
    }
    
    enum CacheFileNames: String {
        case loginResponse = "loginResponse.json"
    }
    
    let appId: Int64
    let channelIDStoreDirectory: FileDirectory
    var cachedLoginResponse: LoginResponse? = nil
    
    init(appId: Int64, createDir: Bool = false) {
        self.appId = appId
        let channelIDStoreDirectory = Self.ChannelStoreDirectory.childDirectory(name: String(appId))
        self.channelIDStoreDirectory = channelIDStoreDirectory
        if createDir {
            self.createDirectory()
        }
    }
    
    @discardableResult
    func cachePath(loginResponse: LoginResponse) -> FilePath? {
        let filePath = FilePath(fileName: CacheFileNames.loginResponse.rawValue, fileDirectory: self.channelIDStoreDirectory)
        return filePath
    }
    
    @discardableResult
    func updateCache(loginResponse: LoginResponse) -> Bool {
        self.cachedLoginResponse = loginResponse
        guard let filePath = self.cachePath(loginResponse: loginResponse) else {
            return false
        }
        
        let encodeResult = CodableHelper.encode(loginResponse)
        switch encodeResult {
        case .success(let dataToWrite):
            do {
                try dataToWrite.write(to: filePath.fileURL, options: .noFileProtection)
                Logger.debug("Channel Store Cache - ID: \(String(appId)) - Cached LoginResponse: \(filePath.fileURL)")
                return true
            }  catch {
                print(error.localizedDescription)
                return false
            }
        case .failure:
            return false
        }
    }
    
//    func reloadCaches(files: [CacheFileNames]) {
//        files.forEach { cacheFileName in
//            switch cacheFileName {
//            case .loginResponse:
//                
//            }
//            
//        }
//    }
//    
//    func clearLoadedCaches(files: [CacheFileNames]) {
//        files.forEach { cacheFileName in
//            
//        }
//    }
//    
//    func clearStoredCaches(files: [CacheFileNames]) {
//        files.forEach { cacheFileName in
//            
//        }
//    }

    func pathExists() -> Bool {
        return self.channelIDStoreDirectory.pathExists()
    }
    
    func recreateDirectory() {
        if channelIDStoreDirectory.pathExists() {
            try? FileManager.default.removeItem(at: channelIDStoreDirectory.directoryURL)
            channelIDStoreDirectory.createDirectory(withIntermediateDirectories: true)
        } else {
            channelIDStoreDirectory.createDirectory(withIntermediateDirectories: true)
        }
    }
    
    func createDirectory() {
        if !channelIDStoreDirectory.pathExists() {
            channelIDStoreDirectory.createDirectory(withIntermediateDirectories: true)
        }
    }
    
    func deleteDirectory() {
        if channelIDStoreDirectory.pathExists() {
            try? FileManager.default.removeItem(at: channelIDStoreDirectory.directoryURL)
        }
    }

}
