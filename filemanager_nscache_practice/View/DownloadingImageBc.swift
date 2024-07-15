//
//  DownloadingImageBc.swift
//  IntermediateSwiftUi
//
//  Created by ImDung on 15/7/24.
//

import SwiftUI

struct DownloadingImageBc: View {
    @StateObject var vm = DownloadingImageViewModel()
    var body: some View {
        NavigationStack{
            List{
                ForEach(vm.photos) { photo in
                    DownloadingImagesRow(photo: photo)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownloadingImageBc()
}
