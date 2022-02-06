//
//  MyFoodsView.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 2/1/22.
//

//
//  Notes.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 2/1/22.
//

import SwiftUI


struct NoteItem2: Codable, Hashable, Identifiable {
    let id: Int
    let commonFoodPoints: String
    let text: String
}

struct CommonFoodsPointValueView : View {
    @State var items2: [NoteItem2] = {
        guard let data2 = UserDefaults.standard.data(forKey: "notes2") else { return [] }
        if let json = try? JSONDecoder().decode([NoteItem2].self, from: data2) {
            return json
        }
        return []
    }()

    @AppStorage("myCommonFoods") var myCommonFoods: String = ""

    @AppStorage("commonFoodPoints") var commonFoodPoints: String = ""

    @State var showAlert2 = false

    @State var itemToDelete2: NoteItem2?


    var body: some View {
        VStack {
            inputView2
            Divider()
            List {
                Section(
                    header:
                        HStack {
                            Text("Common Food Points  ").foregroundColor(.red)

                            Image(systemName: "123.rectangle").foregroundColor(.cyan)

                        }.font(.headline)
                        .padding(.bottom, 15)

                ) {
                    ForEach(items2, id: \.self) { item in

                        HStack {
                            Text("\(item.commonFoodPoints)  ").foregroundColor(.red)
                            Text(item.text).lineLimit(nil).multilineTextAlignment(.leading).foregroundColor(.cyan)
                            Spacer()
                        }

                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }

            }
        }
    }

    func didTapAddTask() {
        let id = items2.reduce(0) { max($0, $1.id) } + 1
        items2.insert(NoteItem2(id: id, commonFoodPoints: commonFoodPoints, text: myCommonFoods), at: 0)
        commonFoodPoints = ""
        myCommonFoods = ""
        save()
    }

    func deleteNote2() {
        guard let itemToDelete2 = itemToDelete2 else { return }
        items2 = items2.filter { $0 != itemToDelete2 }
        save()
    }
    

    func save() {
        guard let data2 = try? JSONEncoder().encode(items2) else { return }
        UserDefaults.standard.set(data2, forKey: "notes2")
    }

    var alert: Alert {


        Alert(title: Text("Hey!"),
              message: Text("Are you sure you want to delete this item?"),
              primaryButton: .destructive(Text("Delete"), action: deleteNote2),
              secondaryButton: .cancel())
    }


    func delete(indexSet: IndexSet) {
        items2.remove(atOffsets: indexSet)
        save()
    }


    func move(indices: IndexSet, newOffset: Int) {
        items2.move(fromOffsets: indices, toOffset: newOffset)
        save()

    }



    var inputView2: some View {
        VStack {
            VStack {

                HStack {

                    TextField("Points", text: $commonFoodPoints)
                        .padding(.leading, 25)
                        .frame(alignment: .center)
                        .foregroundColor(.red)
                        .keyboardType(.numberPad)
                    Button(action: didTapAddTask, label: {

                        Text("Add Item") }).padding(8).foregroundColor(.cyan)
                }


                HStack {
                    TextField("Frequent Food", text: $myCommonFoods)
                        .padding(.leading, 25)
                        .frame(alignment: .center)
                        .foregroundColor(.cyan)
                        .clipped()
                    EditButton().padding(8).foregroundColor(.cyan)
                }
            }.padding(.top, 25)
        }
    }
    
}
