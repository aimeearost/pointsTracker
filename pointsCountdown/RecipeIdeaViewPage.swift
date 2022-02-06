
//

import SwiftUI


struct RecipeNotes: Codable, Hashable, Identifiable {
    let id: Int
    let recipeTitle: String
    let recipeSourceWebsite: String
//    let text: String
}

struct RecipeIdeaViewPage : View {

    
    @State var items3: [RecipeNotes] = {
        guard let data3 = UserDefaults.standard.data(forKey: "notes3") else { return [] }
        if let json = try? JSONDecoder().decode([RecipeNotes].self, from: data3) {
            return json
        }
        return []
    }()

//    @State var recipeDescription: String = ""

    @State var recipeTitle: String = ""

    @State var showAlert3 = false

    @State var itemToDelete3: RecipeNotes?

    @State var recipeSourceWebsite: String = ""



    var inputView3: some View {
        VStack {
            VStack {

                HStack {

                    TextField("Title", text: $recipeTitle)
                            .padding(.leading, 25)
                            .frame(alignment: .center)
                            .foregroundColor(.red)
                            .keyboardType(.default)
                        Button(action: didTapAddTask, label: { Text("Add Note") }).padding(8).foregroundColor(.cyan)
                }

                HStack {
                    TextField("Source", text: $recipeSourceWebsite)
                        .padding(.leading, 25)
                        .frame(alignment: .center)
                        .foregroundColor(.cyan)
                        .clipped()
                    .keyboardType(.default)
                    EditButton().padding(8).foregroundColor(.cyan)
                }
            }.padding(.top, 25)

        }
    }

    var body: some View {


        VStack {
            inputView3
            Divider()
            List {
                Section(
                    header:
                        HStack {
                            Text("Recipe Ideas  ")
                            Image(systemName: "mouth.fill")
                                .frame(width: 10, height: 15).foregroundColor(.cyan)
                                .padding(.trailing, 20)

                        }.font(.headline)
                        .foregroundColor(.red)
                        .padding(.bottom, 15)
                )
                {
                        ForEach(items3, id: \.self) { item in
                            HStack {
                            Text(item.recipeTitle).font(.headline).foregroundColor(.red)
                                Spacer()
                                Text(item.recipeSourceWebsite).foregroundColor(.cyan)
                            }
                            
                        }
                        .onDelete(perform: deleteNote3)
                        .onMove(perform: move)


                }

            }
//            List(items3) { item in
//                VStack(alignment: .leading) {
//
//                    HStack {
//                        Text(item.recipeTitle).foregroundColor(.red)
//                        Text(item.recipeSourceWebsite).foregroundColor(.cyan)
//                        Spacer()
//                        Image(systemName: "trash.circle").foregroundColor(.red).font(.title3)
//                    }
//
//                }
//                .onTapGesture {
//                    self.itemToDelete3 = item
//                    self.showAlert3 = true
//                }
//            }
//            .alert(isPresented: $showAlert3, content: {
//                alert
//            })
        }
    }

    func didTapAddTask() {
        let id = items3.reduce(0) { max($0, $1.id) } + 1
        items3.insert(RecipeNotes(id: id, recipeTitle: recipeTitle, recipeSourceWebsite: recipeSourceWebsite), at: 0)
        recipeTitle = ""
        recipeSourceWebsite = ""
        save()
    }

    func deleteNote3(indexSet: IndexSet) {
        items3.remove(atOffsets: indexSet)
        save()
    }

    func save() {
        guard let data2 = try? JSONEncoder().encode(items3) else { return }
        UserDefaults.standard.set(data2, forKey: "notes3")
    }

    func move(indices: IndexSet, newOffset: Int) {
        items3.move(fromOffsets: indices, toOffset: newOffset)
        save()

    }

}
