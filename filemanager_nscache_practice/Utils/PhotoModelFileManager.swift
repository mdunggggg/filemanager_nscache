//
//  PhotoModelFileManager.swift
//  filemanager_nscache_practice
//
//  Created by ImDung on 15/7/24.
//

import Foundation
import SwiftUI

class PhotoModelFileManager {
    static let instance = PhotoModelFileManager()
    let folderName = "downloaded_photos"
    private init(){
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded(){
        guard let url = getFolderPath() else {return}
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("create folder")
            }
            catch{
                print(error)
            }
        }
           
    }
    private func getFolderPath() -> URL? {
        return FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    // url: .../downloaded_photos/
    // url: .../downloaded_photos/image.png
    private func getImagePath(key : String) -> URL? {
        guard let folder = getFolderPath() else {return nil}
        return folder.appendingPathComponent(key + ".png")
    }
    
    func add(key: String, value : UIImage){
        guard
            let data = value.pngData(),
            let url = getImagePath(key: key) else {return}
        do {
            try data.write(to: url)
        }
        catch{
            print(error)
        }
                
    }
    func get(key : String) -> UIImage?{
        guard let url = getImagePath(key: key),
              FileManager.default.fileExists(atPath: url.path()) else{
            return nil
        }
        return UIImage(contentsOfFile: url.path())
    }
}
