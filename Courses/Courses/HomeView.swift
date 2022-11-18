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
                HStack(spacing: 20) {
                    ForEach(Section.sectionData) { item in
                        GeometryReader { geometry in
                            let degree = Double(geometry.frame(in: .global).minX - 30) / -20
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: degree),
                                                  axis: (x: 0, y: 10.0, z: 0))
                        }
                        .frame(width: 275,
                               height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
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
    var section: Section

    var body: some View {
        VStack {
            VStack {
                HStack(alignment: .top) {
                    Text(section.title)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 120)
                        .foregroundColor(.white)
                    Spacer()
                    Image(section.logo)
                }
                Text(section.text.uppercased())
                    .frame(maxWidth: .infinity, alignment: .leading)
                section.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.horizontal)
            .padding(.top, 30)
        }
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
