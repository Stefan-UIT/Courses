//
//  Home.swift
//  Courses
//
//  Created by TrungVo_Diag on 17/11/2022.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState: CGSize = .zero
    private let avatar = Image.avatar
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
                .edgesIgnoringSafeArea(.all)

            HomeView(avatar: avatar,
                     showProfile: $showProfile)
                .padding(.top, 44)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? ((self.viewState.height/10.0) - 10.0) : 0), axis: (x: 10, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: viewState)
                .edgesIgnoringSafeArea(.all)


            MenuView()
                .background(.black.opacity(0.0001))
                .offset(y: showProfile ? 0 : ScreenHelper.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: showProfile)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: viewState)
                .onTapGesture {
                    self.showProfile = false
                }
                .gesture(
                    DragGesture().onChanged({ value in
                        self.viewState = value.translation
                    })
                    .onEnded({ value in
                        self.viewState = .zero
                        if value.translation.height > 50 {
                            self.showProfile = false
                        }
                    })
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    var avatar: Image
    @Binding var showProfile: Bool
    var body: some View {
        Button {
            self.showProfile.toggle()
        } label: {
            avatar
                .resizable()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
        }
    }
}
