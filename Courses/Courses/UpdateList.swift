//
//  UpdateList.swift
//  Courses
//
//  Created by TrungVo_Diag on 22/11/2022.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()

    func addUpdate() {
        store.updates.append(.init(image: "Card1", title: "New Title", text: "New Text", date: "New Date"))
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: Text(update.text)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)

                            VStack(alignment: .leading, spacing: 8) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete { index in
                    guard let index = index.first else { return }
                    self.store.updates.remove(at: index)
                }
                .onMove { source, destination in
                    self.store.updates.move(fromOffsets: source,
                                            toOffset: destination)
                }
            }
            .navigationTitle("Update")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: addUpdate) {
                        Text("Add Update")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
