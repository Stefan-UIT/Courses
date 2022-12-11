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
    @State var showUpdate: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                AvatarView(avatar: avatar,
                           showProfile: $showProfile)
                Button {
                    self.showUpdate.toggle()
                } label: {
                    Image(systemName: "bell")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)

            HStack(spacing: 12) {
                RingView(colors: [Color.purple, Color.blue], size: .init(width: 44, height: 44), percent: 68, show: .constant(true))
                VStack(alignment: .leading, spacing: 4) {
                    Text("6 minutes left")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("Watched 10 mins today")
                        .font(.caption)
                }
            }
            .padding(8)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)

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
