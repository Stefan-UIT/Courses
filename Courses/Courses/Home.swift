//
//  Home.swift
//  Courses
//
//  Created by TrungVo_Diag on 17/11/2022.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    private let avatar = Image("Avatar")
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Watching")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        self.showProfile.toggle()
                    } label: {
                        avatar
                            .resizable()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
                Spacer()
            }
            .padding(.top, 44)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(Angle(degrees: showProfile ? -10 : 0), axis: (x: 10, y: 0, z: 0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
            .edgesIgnoringSafeArea(.all)

            MenuView()
                .offset(y: showProfile ? 0 : 500)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
