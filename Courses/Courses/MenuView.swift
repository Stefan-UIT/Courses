//
//  MenuView.swift
//  Courses
//
//  Created by TrungVo_Diag on 17/11/2022.
//

import SwiftUI

struct MenuView: View {
    private let avatar = Image("Avatar")
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                Text("Meng - 28% complete")
                    .font(.caption)
                Color.white
                    .frame(width: 30, height: 6)
                    .clipShape(RoundedRectangle.init(cornerRadius: 3))
                    .shadow(radius: 3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(.black.opacity(0.08))
                    .clipShape(RoundedRectangle.init(cornerRadius: 3))
                    .frame(width: 150, height: 24)
                    .background(.black.opacity(0.1))
                    .clipShape(RoundedRectangle.init(cornerRadius: 10))

                VStack(alignment: .leading, spacing: 16) {
                    MenuRow(title: "Account", icon: "gear")
                    MenuRow(title: "Billing", icon: "creditcard")
                    MenuRow(title: "Sign out", icon: "person.crop.circle")
                }
                .offset(x: -20)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [.white, Color.init(hex: "#DEE4F1")]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal, 30)
            .overlay {
                avatar
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60,
                           height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            }
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
