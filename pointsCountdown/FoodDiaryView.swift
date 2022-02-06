//
//  Notes.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 2/1/22.
//

import SwiftUI

let dateFormatter = DateFormatter()

struct NoteItem: Codable, Hashable, Identifiable {
    let id: Int
    let text: String
    var date = Date()
    var dateText: String {
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: date)
    }
    let points: String

}

struct FoodDiaryView : View {
    @State var items: [NoteItem] = {
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        if let json = try? JSONDecoder().decode([NoteItem].self, from: data) {
            return json
        }
        return []
    }()

    @State var taskText: String = ""

    @State var points: String = ""

    @State var showAlert = false

    @State var itemToDelete: NoteItem?


    var body: some View {
        VStack {
            inputView
            List {
                Section(
                    header:
                        HStack {
                            Text("Food diary  ").foregroundColor(.red)
                            Image(systemName: "square.and.pencil").foregroundColor(.cyan)
                        }.font(.headline)
                        .padding(.bottom, 15)

                ) {
                    ForEach(items, id: \.self) { item in
                        HStack {
                            Text("\(item.dateText)  ").font(.headline).foregroundColor(.red)
                            Text(item.text).lineLimit(nil).multilineTextAlignment(.leading).foregroundColor(.cyan)
                            Spacer()
                            Text("\(item.points) pts  " ).font(.headline).foregroundColor(.red)
                        }                        }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }

            }
        }.accentColor(.red)
            .navigationTitle("Fruity Fruits")
            .navigationBarItems(
                leading: EditButton())
    }


    var inputView: some View {
        VStack {

            HStack {

                TextField("Points", text: $points)
                    .padding(.leading, 25)
                    .frame(alignment: .center)
                    .foregroundColor(.red)
                    .keyboardType(.numberPad)
                Button(action: didTapAddTask, label: {

                    Text("Add Item") }).padding(8).foregroundColor(.cyan)
            }


            HStack {
                TextField("Food", text: $taskText)
                    .padding(.leading, 25)
                    .frame(alignment: .center)
                    .foregroundColor(.cyan)
                    .clipped()
                EditButton().padding(8).foregroundColor(.cyan)
            }
        }.padding(.top, 25)
    }


    var addButton: some View {
        Button("Add", action: {

        })
    }

    func didTapAddTask() {
        let id = items.reduce(0) { max($0, $1.id) } + 1
        items.insert(NoteItem(id: id, text: taskText, points: points), at: 0)
        taskText = ""
        save()
    }

    func deleteNote() {
        guard let itemToDelete = itemToDelete else { return }
        items = items.filter { $0 != itemToDelete }
        save()
    }

    func save() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: "notes")
    }


    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        save()
    }


    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
        save()

    }

    var alert: Alert {


        Alert(title: Text("Hey!"),
              message: Text("Are you sure you want to delete this item?"),
              primaryButton: .destructive(Text("Delete"), action: deleteNote),
              secondaryButton: .cancel())
    }
    
}

