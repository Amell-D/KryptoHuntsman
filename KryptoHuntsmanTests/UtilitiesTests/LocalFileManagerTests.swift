//
//  LocalFileManagerTests.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/27/22.
//

import XCTest

@testable import SwiftyCrypto

class LocalFileManagerTests: XCTestCase {

    let image = UIImage(systemName: "trash")

    let fileManager = LocalFileManager.instance

    func testSavingAndGettingImage() throws {
        XCTAssertNoThrow(fileManager.saveImage(image: image!, imageName: "trash", folderName: "testing"))
        XCTAssertNotNil(fileManager.getImage(imageName: "trash", folderName: "testing"))
    }

    func testSavingAndDeletingImage() throws {
        XCTAssertNoThrow(fileManager.saveImage(image: image!, imageName: "trash", folderName: "testing"))
        XCTAssertTrue(fileManager.deleteImage(imageName: "trash", folderName: "testing"))
    }

    func testDeletingNonPresentImage() throws {
        XCTAssertFalse(fileManager.deleteImage(imageName: "test", folderName: "testing"))
    }

    func testGettingNonPresentImage() throws {
        XCTAssertNil(fileManager.getImage(imageName: "test", folderName: "testing"))
    }

}
