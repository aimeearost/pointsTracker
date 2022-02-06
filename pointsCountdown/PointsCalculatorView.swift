//
//  PointsCalculatorView.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 1/25/22.
//

import Foundation
import SwiftUI
import DLRadioButton



struct PointsCalculatorView: View {


    @State var calories: String = ""
    @State var caloriesAsDouble: Double = 0.0

    @State var saturatedFat: String = ""
    @State var saturatedFatAsDouble: Double = 0.0


    @State var protein: String = ""
    @State var proteinAsDouble: Double = 0.0

    @State var totalSugar: String = ""
    @State var totalSugarAsDouble: Double = 0.0

    @State var foodPointsAnswer: String = "______"
    @State var foodPointsAnswerAsDouble: Double = 0.0

    @AppStorage("weight") var weight: String = ""
    @State var weightAsDouble: Double = 0.0

    @State var exerciseDuration: String = ""
    @State var exerciseDurationAsDouble: Double = 0.0

    @State var exercisePointsAnswer: String = "______"
    @State var exercisePointsAnswerAsDouble: Double = 0.0

    @State var selectedIntensity: String = ""

    let intensity = ["Lt", "Mod", "Hvy"]
    let intensityAsDouble = 0.0

    @State var exercisePointsTallyAsInt: Int = 0

    @State var finalAnswer = 0

    var body: some View {
                      Form {
                              Text("CALCULATE SMARTPOINTS").foregroundColor(.red)
                                  .font(.subheadline)
                                             HStack {
                                                 Text("Calories")
                                                     .foregroundColor(Color.cyan)
                                                     .frame(width: 150, height: 12, alignment: .leading)
                                                 Spacer()
                                                 TextField("", text: $calories)
                                                     .keyboardType(.numberPad)
                                                      .onSubmit {
                                                          caloriesAsDouble = Double(calories)!
                                                      }
                                                      .multilineTextAlignment(TextAlignment.center)
                                                      .border(Color.red)
                                                      .frame(width: 100, height: 12, alignment: .leading)
                                             }
                                             HStack {
                                                 Text("Saturated Fat")
                                                     .foregroundColor(Color.cyan)
                                                     .frame(width: 150, height: 12, alignment: .leading)
                                                 Spacer()
                                                 TextField("", text: $saturatedFat)
                                                            .keyboardType(.numberPad)
                                                            .onSubmit {
                                                                saturatedFatAsDouble = Double(saturatedFat)!
                                                            }
                                                            .multilineTextAlignment(TextAlignment.center)
                                                            .border(Color.red)
                                                            .frame(width: 100, height: 12, alignment: .leading)
                                             }
                                             HStack {
                                                 Text("Protein")
                                                     .foregroundColor(Color.cyan)
                                                     .frame(width: 150, height: 12, alignment: .leading)
                                                 Spacer()
                                                 TextField("", text: $protein)
                                                     .keyboardType(.numberPad)
                                                     .onSubmit {
                                                         proteinAsDouble = Double(protein)!
                                                     }
                                                     .multilineTextAlignment(TextAlignment.center)
                                                     .border(Color.red)
                                                     .frame(width: 100, height: 12)
                                             }
                                             HStack {
                                                 Text("Total Sugars")
                                                     .foregroundColor(Color.cyan)
                                                     .frame(width: 150, height: 12, alignment: .leading)
                                                     .font(.subheadline)


                                                 Spacer()
                                                 TextField("", text: $totalSugar)
                                                     .keyboardType(.numberPad)
                                                     .onSubmit {
                                                         totalSugarAsDouble = Double(totalSugar)!
                                                     }
                                                     .multilineTextAlignment(TextAlignment.center)
                                                     .border(Color.red)
                                                     .frame(width: 100, height: 12)
                                             }
                                             HStack {
                                                     Button("CALCULATE") {
                                                         finalAnswer = 0
                                                         self.caloriesAsDouble =       Double(self.calories) ?? 0
                                                         self.totalSugarAsDouble =     Double(self.totalSugar) ?? 0
                                                         self.proteinAsDouble =        Double(self.protein) ?? 0
                                                         self.saturatedFatAsDouble =   Double(self.saturatedFat) ?? 0
                                                         foodPointsAnswerAsDouble = (caloriesAsDouble * 0.0305) + (saturatedFatAsDouble * 0.275) + (totalSugarAsDouble * 0.12) - (proteinAsDouble * 0.098)
                                                         let roundedAnswer = Int(round(foodPointsAnswerAsDouble))
                                                         foodPointsAnswer = String(roundedAnswer)
                                                     }
                                                     .foregroundColor(Color.cyan)
                                                     .frame(width: 175, height: 12, alignment: .leading)
                                                     .font(.subheadline)
                                                 Spacer()
                                                 Text("\(foodPointsAnswer)")
                                                     .frame(width: 150, height: 12)
                                                     .font(.title2)
                                                     .foregroundColor(Color.red)
                                             }
                      }
        
                      .padding(.top, 100)
                      .frame( alignment: .top)
    }
//
}

    struct PointsCalculatorView_Previews: PreviewProvider {
        static var previews: some View {
            PointsCalculatorView()
        }
    }





//                          Group {
//                              Text("CALCULATE EXERCISE POINTS").foregroundColor(.red)
//                                                .font(.subheadline)
//                                            HStack {
//                                                Text("Your weight")
//                                                    .foregroundColor(Color.cyan)
//                                                    .frame(width: 150, height: 12, alignment: .leading)
//                                                    .font(.subheadline)
//                                                Spacer()
//                                                TextField("", text: $weight)
//                                                     .keyboardType(.default)
//                                                     .onSubmit {
//                                                         weightAsDouble = Double(weight)!
//                                                     }
//                                                     .multilineTextAlignment(TextAlignment.center)
//                                                     .border(Color.red)
//                                                     .frame(width: 150, height: 12)
//                                            }
//                                            HStack {
//                                                Text("Exercise Time")
//                                                    .foregroundColor(Color.cyan)
//                                                    .frame(width: 150, height: 12, alignment: .leading)
//                                                    .font(.subheadline)
//                                                Spacer()
//                                                TextField("", text: $exerciseDuration)
//                                                     .keyboardType(.default)
//                                                     .onSubmit {
//                                                         exerciseDurationAsDouble = Double(exerciseDuration)!
//                                                     }
//                                                     .multilineTextAlignment(TextAlignment.center)
//                                                     .border(Color.red)
//                                                     .frame(width: 150, height: 12)
//                                            }
//                                            HStack {
//
//                                                Text("Exercise Level")
//                                                    .foregroundColor(Color.cyan)
//                                                    .frame(width: 150, height: 12, alignment: .leading)
//                                                    .font(.subheadline)
//                                                Spacer()
//                                                    Picker("Exercise Level", selection: $selectedIntensity) {
//                                                                   ForEach(intensity, id: \.self) { intensity in
//                                                                       Text(intensity).foregroundColor(Color.red)
//
//
//                                                                   }
//                                                    }.pickerStyle(SegmentedPickerStyle())
//                                                                   .frame(width: 150, height: 12)
//                                                                   .foregroundColor(Color.red)
//
//
//                                                               Spacer()
//                                                }
//
//                                            HStack {
//                                                    Button("CALCULATE") {
//                                                        self.weightAsDouble =       Double(self.weight) ?? 0
//                                                        self.exerciseDurationAsDouble =     Double(self.exerciseDuration) ?? 0
//
//                                                        var factor = 0.0
//                                                        if selectedIntensity == "Lt" {
//                                                            factor = 0.000232
//                                                        } else if selectedIntensity == "Mod" {
//                                                            factor = 0.000327
//                                                        } else {
//                                                            factor = 0.0008077
//                                                        }
//
//                                                        exercisePointsAnswerAsDouble = (weightAsDouble) * (exerciseDurationAsDouble) * (factor)
//                                                        let roundedAnswer = Int(round(exercisePointsAnswerAsDouble))
//                                                        exercisePointsAnswer = String(roundedAnswer)
//                                                        print(foodPointsAnswer)
//                                                        print(selectedIntensity)
//                                                        exercisePointsTallyAsInt = exercisePointsTallyAsInt + roundedAnswer
//
//
//                                                    }
//                                                    .foregroundColor(Color.cyan)
//                                                    .font(.subheadline)
//                                                    .frame(width: 150, height: 12, alignment: .leading)
//
//                                                Spacer()
//                                                Text("\(exercisePointsAnswer)")
//                                                    .frame(width: 150, height: 12)
//                                                    .foregroundColor(Color.red)
//                                            }
//                                  .padding(.bottom, 10)
//                          }.padding(.leading, 10)
