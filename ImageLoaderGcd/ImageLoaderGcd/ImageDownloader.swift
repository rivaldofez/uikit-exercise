//
//  ImageDownloader.swift
//  ImageLoaderGcd
//
//  Created by Rivaldo Fernandes on 05/01/23.
//

import UIKit

class ImageDownloader {
    func downloadImage(url: URL) async throws -> UIImage {
        async let imageData: Data = try Data(contentsOf: url)
        return UIImage(data: try await imageData)!
    }
}
