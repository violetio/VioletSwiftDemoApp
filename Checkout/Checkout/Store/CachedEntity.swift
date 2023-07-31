//
//  CachedEntity.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import Violet
import Foundation

class CachedEntity<T: Codable> {
    var cachedEntity: T? = nil
    
    let filePath: FilePath
    
    convenience init(appId: Int64, cacheFileName: ChannelStore.CacheFileNames = .loginResponse) {
        self.init(filePath: ChannelStore.ChannelIDStoredEntityFilePath(appId: appId, cacheFileName: cacheFileName))
    }
    
    init(filePath: FilePath) {
        self.filePath = filePath
//        Logger.debug("FilePath: \(filePath.fileURL)")
    }
    
    func reloadData() -> Data? {
        return try? Data(contentsOf: filePath.fileURL)
    }
    
    @discardableResult
    func reloadCachedEntity() -> T? {
        guard let jsonData = reloadData() else {
            self.cachedEntity = nil
            return nil
        }
        
        let decodeResult = CodableHelper.decode(T.self, from: jsonData)
        switch decodeResult {
        case .failure(let error):
            Logger.error(error.localizedDescription)
            self.cachedEntity = nil
            return nil
        
        case .success(let entity):
            self.cachedEntity = entity
            return entity
        
        }
    }
    
    func set(_ entity: T) throws {
        let encodeResult = CodableHelper.encode(entity)
        switch encodeResult {
        case .failure(let error):
            Logger.error(error)
        case .success(let data):
            filePath.fileDirectory.createDirectory(withIntermediateDirectories: true)
            try data.write(to: filePath.fileURL)
            Logger.debug("Stored \(type(of: entity)) at: \(filePath.fileURL)")
            self.cachedEntity = entity
        }
    }
    
    @discardableResult
    func clearCachedEntity() -> Bool {
        self.cachedEntity = nil
        if filePath.fileExists() {
            do {
                try FileManager.default.removeItem(at: filePath.fileURL)
            } catch {
                Logger.error(error)
                return false
            }
        }
        return true
    }
    
    public func fileExists() -> Bool {
        return filePath.fileExists()
    }
}
