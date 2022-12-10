//
//  Update.swift
//  Courses
//
//  Created by TrungVo_Diag on 22/11/2022.
//

import Foundation

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

extension Update {
    static let updateData = [
        Update(image: "Card1",
               title: "SwiftUI Advanced",
               text: "Take your SwiftUI app to the App Store with advance techniques like API data, packages and CMS.",
               date: "JAN 1"),
        Update(image: "Card2",
               title: "Webflow",
               text: "Webflow - Take your SwiftUI app to the App Store with advance techniques like API data, packages and CMS.",
               date: "OCT 17")
    ]
}
