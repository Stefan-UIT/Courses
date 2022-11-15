//
//  ContentView.swift
//  Courses
//
//  Created by TrungVo_Diag on 08/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState: CGSize = .zero
    @State var showCard = false

    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .animation(.default,
                           value: show)
            BackCardView(color: show ? .card3 : .card4)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width,
                        y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(.degrees(10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5),
                           value: show)
            BackCardView(color: show ? .card4 : .card3)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width,
                        y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3),
                           value: show)
            CardView()
                .offset(x: viewState.width,
                        y: viewState.height)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3,
                                   dampingFraction: 0.6),
                           value: viewState)
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture (
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }.onEnded { _ in
                        self.viewState = .zero
                        self.show = false
                    }
                )

            BottomCardView()
                .offset(y: showCard ? 400 : 3000)
                .blur(radius: show ? 20 : 0)
                .animation(.default,
                           value: show)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8),
                           value: showCard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificates")
                        .font(.subheadline)
                        .foregroundColor(.accent)
                }
                Spacer()
                Image.logo1
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image.card1
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var color: Color
    var body: some View {
        color
            .frame(width: 340, height: 220)
            .cornerRadius(20)
            .shadow(radius: 20)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Image.background1
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Desgn+Code instructor")
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.subheadline)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
