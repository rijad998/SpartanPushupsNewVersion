//
//  AsyncUtility delay.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 04/07/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

class AsyncUtility {
    public static func delay(_ delay: Double, closure: @escaping () -> Void ) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + delay, execute: closure
        )
    }
}
