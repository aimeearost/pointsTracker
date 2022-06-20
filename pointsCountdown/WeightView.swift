
//
//  weightData.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 2/1/22.
//

import SwiftUI


struct WeightItem: Codable, Hashable, Identifiable {
    let id: Int
    let text: String
    var date = Date()
    var weightDouble: Double
    var dateText: String {
        dateFormatter.dateFormat = "MMM d yyyy"
        return dateFormatter.string(from: date)
    }
}

struct WeightView: View {
    @State var items7: [WeightItem] = {
        guard let data = UserDefaults.standard.data(forKey: "weightData") else { return [] }
        if let json = try? JSONDecoder().decode([WeightItem].self, from: data) {
            return json
        }
        return []
    }()



    @State var weightText: String = ""

    @State var weightDouble: Double = 0.0

    @State private var birthDate = Date()

    @State var weightArray: [Double] =  []

//    @Binding var array: [String]

    @State var showAlert = false

    @State var weightTexitemToDelete7: WeightItem?

    var alert: Alert {


        Alert(title: Text("Hey!"),
              message: Text("Are you sure you want to delete this item?"),
              primaryButton: .destructive(Text("Delete"), action: deleteNote),
              secondaryButton: .cancel())
    }


    var inputView: some View {
        HStack {
            TextField("Weight", text: $weightText)
                .padding(.leading, 25)
                .clipped()
                .foregroundColor(.cyan)
            Button(action: didTapAddTask, label: { Text("Add Item") }).padding(8).foregroundColor(.cyan)
        }.padding(.top, 25)

//        HStack {
//            TextField("", text: $weightText)
//                .padding(.leading, 25)
//                .clipped()
//                .foregroundColor(.cyan)
//                .frame(width: 75)
//                .border(.red)
//                .frame(alignment: .center)
//            Button(action: didTapAddTask, label: {
//                Image(systemName: "plus")
//            }).padding(8).foregroundColor(.cyan)
//                .frame(alignment: .leading)
//        }.padding(.top, 25)

    }

    var body: some View {
        VStack {
            inputView
            List {
                Section(
                    header:
                        HStack {
                            Text("Weight History  ")
                            Image(systemName: "heart.text.square.fill")
                                .frame(width: 10, height: 15).foregroundColor(.cyan)
                                .padding(.trailing, 20)
                            ChartButtonView()

                        }.font(.headline)
                        .foregroundColor(.red)
                        .padding(.bottom, 15)
                    
                )
                {
                        ForEach(items7, id: \.self) { item in
                            HStack {
                            Text(item.dateText).font(.headline).foregroundColor(.red)
                                Spacer()
                                Text(String(item.weightDouble)).lineLimit(nil).multilineTextAlignment(.leading).foregroundColor(.cyan).padding(.trailing, 20)
                            }
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)


                }

            }
//            List(items7) { item in
//                VStack(alignment: .leading) {
//                    Text(item.dateText).font(.headline).foregroundColor(.red)
//                    HStack {
//                    Text(item.text).lineLimit(nil).multilineTextAlignment(.leading).foregroundColor(.cyan)
//                        Spacer()
//                    Image(systemName: "trash.circle").foregroundColor(.red).font(.title3)
//                    }
//                }
//                .onTapGesture {
//                    self.weightTexitemToDelete7 = item
//                    self.showAlert = true
//                }
//            }
//            .alert(isPresented: $showAlert, content: {
//                alert
//            })
//        }.accentColor(.red)
//                .navigationTitle("Weight Diary")
//                .navigationBarItems(
//                    leading: EditButton())
    }

    }


    var addButton: some View {
        Button("Add", action: {

        })
    }

    func didTapAddTask() {
        let id = items7.reduce(0) { max($0, $1.id) } + 1
        weightDouble = Double(weightText) ?? 0.0
        items7.insert(WeightItem(id: id, text: weightText, weightDouble: weightDouble), at: 0)
//        weightArray.insert(weightDouble, at: 0)
//        print(weightArray)
//        print(
//            ForEach(items7, id: \.self) { item in
//                HStack {
//                    Text(String(item.weightDouble)).lineLimit(nil).multilineTextAlignment(.leading).foregroundColor(.cyan).padding(.trailing, 20)
//                }
//            }
//        )
        weightArray = items7.map{$0.weightDouble}

        print("partArray: \(weightArray)")

        weightText = ""
        save()
    }

    func deleteNote() {
        guard let weightTexitemToDelete7 = weightTexitemToDelete7 else { return }
        items7 = items7.filter { $0 != weightTexitemToDelete7 }
        save()
    }

    func save() {
        guard let data = try? JSONEncoder().encode(items7) else { return }
        UserDefaults.standard.set(data, forKey: "weightData")
        
    }


    func delete(indexSet: IndexSet) {
        items7.remove(atOffsets: indexSet)
    }


    func move(indices: IndexSet, newOffset: Int) {
        items7.move(fromOffsets: indices, toOffset: newOffset)

    }


}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}

struct ChartButtonView: View {

    @EnvironmentObject var everyDayPointsCounter: EveryDayPointsCounter


    @State private var isPresented8: Bool = false
    @State private var dismissed8: Bool = false

    @State var weightArray: [Double] = []



    var body: some View {
        Spacer()
        HStack {
            Button("Weight History") {
                isPresented8 = true
                weightArray = weightArray
            }.padding(5)
                .font(.footnote)

                .foregroundColor(.cyan).border(Color.red, width: 0.75)
                .sheet(isPresented: $isPresented8, content: {
//                    weightArray = weightArray

                    ChartView()

                })
        }

        Spacer()
    }

}
