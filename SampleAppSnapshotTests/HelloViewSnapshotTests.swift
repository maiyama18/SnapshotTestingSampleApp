//
//  SampleAppSnapshotTests.swift
//  SampleAppSnapshotTests
//
//  Created by maiyama18 on 2024/09/13
//  
//

import SnapshotTesting
import SwiftUI
import Testing

@testable import SampleApp

enum SnapshotDevice: String, CaseIterable {
    case iPhone
    case iPad
    
    var viewImageConfig: ViewImageConfig {
        switch self {
        case .iPhone:
            return .iPhone13
        case .iPad:
            return .iPadPro11
        }
    }
}

struct HelloViewSnapshotTests {
    var record: Bool {
        ProcessInfo.processInfo.environment["RECODING_MODE"] == "ON"
    }
    
    @Test @MainActor func testPreviews() throws {
        for preview in HelloView_Previews._allPreviews {
            for device in SnapshotDevice.allCases {
                assertSnapshot(
                    of: UIHostingController(rootView: preview.content),
                    as: .image(
                        on: device.viewImageConfig,
                        precision: 0.80,
                        perceptualPrecision: 0.97
                    ),
                    named: "HelloView-\(device)",
                    record: record
                )
            }
        }
    }
}
