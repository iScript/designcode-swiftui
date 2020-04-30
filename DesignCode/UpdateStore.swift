//
//  UpdateStore.swift
//  DesignCode
//
//  Created by EDZ on 2020/4/30.
//  Copyright © 2020 ykq. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject{
    @Published var updates :[Update] = updateData
}
