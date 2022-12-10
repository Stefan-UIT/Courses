//
//  UpdateStore.swift
//  Courses
//
//  Created by TrungVo_Diag on 22/11/2022.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = Update.updateData
}
