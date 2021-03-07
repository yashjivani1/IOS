//
//  UpdateStore.swift
//  DesignCode2
//
//  Created by haco on 14/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject{
    @Published var updates: [Update] = updateData
}
