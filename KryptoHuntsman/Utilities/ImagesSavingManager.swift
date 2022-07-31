//
//  ImagesSavingManager.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/24/22.
//

import Foundation
import SwiftUI

protocol ImageSavingManager {
    func saveImage(image: UIImage, imageName: String, folderName: String)
    func getImage(imageName: String, folderName: String) -> UIImage?
    func deleteImage(imageName: String, folderName: String) -> Bool
}
