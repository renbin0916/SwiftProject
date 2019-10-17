//
//  String+Extension.swift
//  SwiftProject
//
//  Created by 易 on 17/10/2019.
//  Copyright © 2019 易. All rights reserved.
//

import Foundation
import UIKit

extension String {
    static func lauchImageName() -> String? {
        var imageName: String?
        if let dict = Bundle.main.infoDictionary,
            let images = dict["UILaunchImages"],
            let realImagesArray = images as? [[String : String]],
            let window = UIApplication.shared.windows.first {
            let viewSize = window.bounds.size
            for item in realImagesArray {
                if let sizeString = item["UILaunchImageSize"] {
                    let size = NSCoder.cgSize(for: sizeString)
                    if size.equalTo(viewSize) {
                        imageName = item["UILaunchImageName"]
                        return imageName
                    }
                }
            }
        }
        return imageName
    }
}
