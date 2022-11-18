//
//  HomeView.swift
//  Courses
//
//  Created by TrungVo_Diag on 18/11/2022.
//

import SwiftUI

struct HomeView: View {
    var avatar: Image
    @Binding var showProfile: Bool
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                AvatarView(avatar: avatar,
                           showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)

            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(0 ..< 5) { item in
                        SectionView(title: "Prototype designs in SwiftUI",
                                    description: "18 sections",
                                    image: .card1,
                                    color: .card1)
                    }
                }
                .padding(30)
                .padding(.bottom)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(avatar: .avatar,
                 showProfile: .constant(false))
    }
}

struct SectionView: View {
    var title: String
    var description: String
    var image: Image
    var color: Color

    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    Text(title)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 120)
                        .foregroundColor(.white)
                    Spacer()
                    Image.logo1
                }
                Text(description.uppercased())
                    .frame(maxWidth: .infinity, alignment: .leading)
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.horizontal)
            .padding(.top, 30)
        }
        .frame(width: 275, height: 275)
        .background(color)
        .cornerRadius(30)
        .shadow(color: color, radius: 10, x: 0, y: 20)
    }
}
