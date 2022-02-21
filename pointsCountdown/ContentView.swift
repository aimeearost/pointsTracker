//
//  ContentView2.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 1/23/22.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var everyDayPointsCounter: EveryDayPointsCounter

    let columns = [GridItem(.fixed(25)),
                   GridItem(.fixed(25)),
                   GridItem(.fixed(25)),
                   GridItem(.fixed(25)),
                   //                   GridItem(.fixed(25)),
                   //                   GridItem(.fixed(25)),
                   //                   GridItem(.fixed(25)),
                   //                   GridItem(.fixed(25)),
                   //                   GridItem(.fixed(25)),
                   GridItem(.fixed(25))
    ]
    //
    //    @State private var isActive: Bool = false
    //    @State private var isActive2: Bool = false
    //    @State private var isActive3: Bool = false

    //
    //    @State var isSelected = false
    //    @State var isSelected2 = false
    //    @State var isSelected3 = false
    //    @State var isSelected4 = false

    @State var thisSelection = false
    @State var numberOfCircles = 0

    @State private var count = 10
    @State private var weeklyPointsCount = 35

    @State var myPoints: String = ""
    @AppStorage("myPointsAsInt") var myPointsAsInt: Int = 16

    @State var myWeeklyPoints: String = ""
    @AppStorage("myWeeklyPointsAsInt") var myWeeklyPointsAsInt: Int = 35
    
    @State var exercisePointsTally: String = "0"
    @AppStorage("exercisePaintsTallyasInt") var exercisePointsTallyAsInt: Int = 0

    @State var waterTally: String = "0"
    @AppStorage("waterTallyAsInt") var waterTallyAsInt: Int = 0

    @State private var age = 18

    @State var addedAmount = 0
    @State var finalAnswer = 0

    @AppStorage("everyDayPointsCounterValue") var everyDayPointsCounterValue: Int = 0
    @AppStorage("weekPointsCounterValue") var weekPointsCounterValue: Int = 0


    let date = DateFormatter.localizedString(from: Date(), dateStyle: .full, timeStyle: .none)

    

    var field: String = ""

    @State private var showingAlert = false


    var addAlert: Alert {


        Alert(title: Text("Hey!"),
              message: Text("Do you want to carry-over points to weekly?"),
              primaryButton: .destructive(Text("Yes"), action: carryOver),
              secondaryButton: .cancel())    }


    func carryOver() {


        if everyDayPointsCounter.everyDayPointsCounterValue > 0 && everyDayPointsCounter.everyDayPointsCounterValue < 5 {

            everyDayPointsCounter.weekPointsCounterValue = everyDayPointsCounter.weekPointsCounterValue + everyDayPointsCounter.everyDayPointsCounterValue

            } else if everyDayPointsCounter.everyDayPointsCounterValue >= 5 {
                everyDayPointsCounter.weekPointsCounterValue = everyDayPointsCounter.weekPointsCounterValue + 4

            } else {
            everyDayPointsCounter.everyDayPointsCounterValue = 16

        }


    }

    var body: some View {
        VStack {
            HeaderView()
            
            VStack {


                VStack {
                    Stepper("Daily", value: $everyDayPointsCounterValue, in: 0...130).padding(.trailing, 30).padding(.leading, 30).foregroundColor(.cyan).font(.title3)
                        .padding(.bottom, 10)
                        .frame(width: 300, height: 35, alignment: .center)
                    HStack {
                        Spacer()
                        Text("Balance:  \(everyDayPointsCounterValue)").foregroundColor(.red).font(.subheadline)
                        Spacer()
                        Button("Reset") {
                            showingAlert = true
//                            everyDayPointsCounterValue = 16
//                            myPointsAsInt = 16
                        }.padding(5)
                            .font(.footnote)
                            .foregroundColor(.cyan).border(Color.red, width: 0.75)
                            .alert("Do you want to carry-over points to weekly?", isPresented: $showingAlert) {
                                Button("Yes") {
                                    carryOver()
                                    everyDayPointsCounter.everyDayPointsCounterValue = 16

                                }

                                Button("No") {
                                    everyDayPointsCounterValue = 16
                                    showingAlert = false
                                }
                                Button("Cancel") {
                                    everyDayPointsCounter.everyDayPointsCounterValue = everyDayPointsCounter.everyDayPointsCounterValue

                                }
                            }.accentColor(.cyan)
                        Spacer()
                    }
                }
                .padding(.bottom, 15)

                VStack {
                    Stepper("Weekly", value: $weekPointsCounterValue, in: 0...130).padding(.trailing, 30).padding(.leading, 30).foregroundColor(.cyan).font(.title3)
                        .padding(.bottom, 10)
                        .frame(width: 300, height: 35, alignment: .center)
                    HStack {
                        Spacer()
                        Text("Balance:  \(weekPointsCounterValue)").font(.subheadline).foregroundColor(.red)
                        Spacer()
                        Button("Reset") {
                            weekPointsCounterValue = 35
                            myWeeklyPointsAsInt = 35
                        }.padding(5)
                            .font(.footnote)
                            .foregroundColor(.cyan).border(Color.red, width: 0.75)
                        Spacer()
                    }

                }.padding(.bottom, 15)

                VStack {
                    HStack {
                        Stepper("Activity Pts", value: $exercisePointsTallyAsInt, in: 0...10).padding(.trailing, 30).padding(.leading, 30).foregroundColor(.cyan).font(.title3)

                            .frame(width: 300, height: 35, alignment: .center)
                    }.padding(.bottom, 10)
                    HStack {
                        LazyVGrid(columns: columns, content: {
                            ForEach(0..<exercisePointsTallyAsInt, id: \.self) { index in

                                HStack {
                                    Image("exercise").resizable()
                                        .frame(width: 25, height: 30).foregroundColor(.cyan)
                                    //                                    CircleView(backgroundColor: Color.red)
                                }
                            }
                        }).padding(.bottom, 5)
                            .padding(.top, 7.5)
                            .frame(width: 175, height: 30, alignment: .center)
                        Button("Reset") {
                            exercisePointsTallyAsInt = 0
                        }.padding(5)
                            .font(.footnote)
                            .foregroundColor(.cyan).border(Color.red, width: 0.75)
                    }

                }                .padding(.bottom, 10)

                VStack {
                    HStack {
                        Stepper("Water (8 oz)", value: $waterTallyAsInt, in: 0...10).padding(.trailing, 30).padding(.leading, 30).foregroundColor(.cyan).font(.title3)

                            .frame(width: 300, height: 35, alignment: .center)
                    }.padding(.bottom, 10)
                    HStack {
                        LazyVGrid(columns: columns, content: {
                            ForEach(0..<waterTallyAsInt, id: \.self) { index in

                                HStack {
                                    CircleView(backgroundColor: Color.red)
                                }
                            }
                        }).padding(.bottom, 5)
                            .padding(.top, 7.5)
                            .frame(width: 175, height: 30, alignment: .center)
                        Button("Reset") {
                            waterTallyAsInt = 0
                        }.padding(5)
                            .font(.footnote)
                            .foregroundColor(.cyan).border(Color.red, width: 0.75)
                    }

                }
                .padding(.bottom, 10)
                Spacer()
            }
            VStack {
                ButtonView()
            }
        }.padding(.top, 40)
            .ignoresSafeArea()
    }
}




// MARK: - VIEWS

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - CircleView
struct CircleView: View {

    var backgroundColor: Color

    var body: some View {
        ZStack {
            Image("water-glass").resizable()
                .frame(width: 25, height: 30).foregroundColor(.cyan)
            //            Circle()
            //                .stroke(lineWidth: 0.0)
            //                .opacity(0.8)
            //                .foregroundColor(Color.red)
            //                .frame(width: 12, height: 12, alignment: .center)
            //                .background(Circle().foregroundColor(backgroundColor))

        }
    }
}

// MARK: - HeaderView
struct HeaderView: View {

    @EnvironmentObject var everyDayPointsCounter: EveryDayPointsCounter

    var body: some View {
        Text("Track Your Points")
            .padding(.top, 25)
            .foregroundColor(.red)
            .font(.title)
        Text("A running balance of daily, weekly, and exercise points.").font(.subheadline).foregroundColor(.cyan).padding(.bottom, 25)
            .multilineTextAlignment(.center)
            .padding(.leading, 20)
            .padding(.trailing, 20)
    }
    
}

// MARK: - ButtonView
struct ButtonView: View {

    @EnvironmentObject var everyDayPointsCounter: EveryDayPointsCounter


    @State private var isPresented: Bool = false
    @State private var dismissed: Bool = false

    @State private var isPresented2: Bool = false
    @State private var dismissed2: Bool = false

    @State private var isPresented3: Bool = false
    @State private var dismissed3: Bool = false


    @State private var isPresented4: Bool = false
    @State private var dismissed4: Bool = false

    @State private var isPresented5: Bool = false
    @State private var dismissed5: Bool = false

    @State private var isPresented6: Bool = false
    @State private var dismissed6: Bool = false

    @State private var isPresented7: Bool = false
    @State private var dismissed7: Bool = false

    @State var addedExercisePointsTallyAsInt = 0



    var body: some View {
        Spacer()
        HStack {
            Button("Food Diary") {
                isPresented4 = true
            }.padding(5)
                .font(.footnote)

                .foregroundColor(.cyan).border(Color.red, width: 0.75)
                .sheet(isPresented: $isPresented4, content: {

                    FoodDiaryView()

                })
            Button("Frequent Foods") {
                isPresented5 = true
            }.padding(5)
                .font(.footnote)

                .foregroundColor(.cyan).border(Color.red, width: 0.75)
                .sheet(isPresented: $isPresented5, content: {

                    CommonFoodsPointValueView()
                })
        }
        HStack {
            Button("Zero Point List") {
                isPresented3 = true
            }.padding(5)
                .font(.footnote)

                .foregroundColor(.cyan).border(Color.red, width: 0.75)
                .sheet(isPresented: $isPresented3, content: {

                    PointsView()

                })
            Button("Recipe Notes") {
                isPresented6 = true
            }.padding(5)
                .font(.footnote)

                .foregroundColor(.cyan).border(Color.red, width: 0.75)
                .sheet(isPresented: $isPresented6, content: {
                    RecipeIdeaViewPage()
                })
        }
        HStack {
            Button(action: {
                isPresented = true

            }) {
                HStack {
                    Text("Exercise")
                    Image("icons8-calculator").resizable()
                        .frame(width: 30, height: 35)
                }
            }
            .padding(5)
            .font(.footnote)
            .foregroundColor(.cyan).border(Color.red, width: 0.75)
            .sheet(isPresented: $isPresented, content: {
                AddExerciseView(addedExercisePointsTallyAsInt: $addedExercisePointsTallyAsInt)
            })

            Button(action: {
                isPresented2 = true

            }) {
                HStack {
                    Text("Points")
                    Image("icons8-calculator")
                        .resizable()
                        .frame(width: 30, height: 35).foregroundColor(.cyan)
                }
            }
            .padding(5)
            .font(.footnote)

            .foregroundColor(.cyan).border(Color.red, width: 0.75)
            .sheet(isPresented: $isPresented2, content: {
                PointsCalculatorView()
            })
            Button(action: {
                isPresented7 = true

            }) {
                HStack {
                    Text("Weight")
                    Image("icons8-scale-64")
                        .resizable()
                        .frame(width: 30, height: 35).foregroundColor(.cyan)
                }.frame(width: 100)

            }
            .padding(5)
            .font(.footnote)

            .foregroundColor(.cyan).border(Color.red, width: 0.75)
            .sheet(isPresented: $isPresented7, content: {
                WeightView()
            })
        }

        Spacer()
    }


}



//                                Spacer()
//                                LazyVGrid(columns: columns, content: {
//                                    ForEach(0..<myWeeklyPointsAsInt, id: \.self) { index in
//
//                                        HStack {
//                                            CircleView(backgroundColor: Color.red)
//                                        }
//                                    }
//                                })



//                VStack {
//
//                    Stepper("Exercise", value: $exercisePointsTallyAsInt, in: 0...130).padding(.trailing, 30).padding(.leading, 30).foregroundColor(.cyan).font(.title3)
//                    //                        Text("\(myPointsAsInt)").font(.subheadline).foregroundColor(.red)
//                        .padding(.bottom, 10)
//                        .frame(width: 300, height: 35, alignment: .center)
//                    HStack {
//                        Spacer()
//                        Text("Balance:  \(exercisePointsTallyAsInt)").font(.subheadline).foregroundColor(.red)
//                        Spacer()
//                        Button("Reset") {
//                            exercisePointsTallyAsInt = 0
//                        }.padding(5)
//                            .font(.footnote)
//                            .foregroundColor(.cyan).border(Color.red, width: 0.75)
//                        Spacer()
//                    }
//                }.padding(.bottom, 15)

//                        VStack {
//                            Text("\(date)").font(.subheadline).foregroundColor(.cyan)
//
//                        }.padding(.bottom, 25)


