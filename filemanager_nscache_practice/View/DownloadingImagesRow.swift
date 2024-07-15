//
//  DownloadingImagesRow.swift
//  IntermediateSwiftUi
//
//  Created by ImDung on 15/7/24.
//

import SwiftUI

struct DownloadingImagesRow: View {
    let photo : PhotoModel
    var body: some View {
        HStack{
            DownloadingImageView(url: photo.url,key: "\(photo.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading){
                Text(photo.title)
                    .fontWeight(.bold)
                Text(photo.url)
                    .foregroundStyle(.gray)
            }
        
        }    }
}

#Preview {
    DownloadingImagesRow(photo: PhotoModel(albumId: 1, id: 1, title: "1", thumbnailUrl: "a", url: "a"))
        .previewLayout(.sizeThatFits)
}
