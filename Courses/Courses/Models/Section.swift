//
//  Section.swift
//  Courses
//
//  Created by TrungVo_Diag on 18/11/2022.
//

import Foundation
import SwiftUI

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

extension Section {
    static let sectionData = [
        Section(title: "Prototype designs in SwiftUI",
                text: "18 Sections",
                logo: "Logo1",
                image: .card1,
                color: .card1),
        Section(title: "Build a SwiftUI app",
                text: "20 Sections",
                logo: "Logo2",
                image: .card2,
                color: .card2),
        Section(title: "Swift UI advanced",
                text: "20 Sections",
                logo: "Logo3",
                image: .card3,
                color: .card3)
    ]
}
