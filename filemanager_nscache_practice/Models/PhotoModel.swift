//
//  PhotoModel.swift
//  IntermediateSwiftUi
//
//  Created by ImDung on 15/7/24.
//

import Foundation

struct PhotoModel : Codable, Identifiable {
    let albumId : Int
    let id : Int
    let title : String
    let thumbnailUrl : String
    let url : String
}
