//
//  MenuView.swift
//  Courses
//
//  Created by TrungVo_Diag on 17/11/2022.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 16) {
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30)
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}


struct MenuRow: View {
    var title: String
    var icon: String
    private let spacing: CGFloat = 16
    private let iconSize: CGSize = .init(width: 32, height: 32)

    var body: some View {
        HStack(spacing: spacing) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: iconSize.width,
                       height: iconSize.height)
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .multilineTextAlignment(.leading)
        }
    }
}
