//
//  PointsCalculatorView.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 1/25/22.
//

import Foundation
import SwiftUI



struct AddExerciseView: View {


    @AppStorage("weight") var weight: String = ""
    @State var weightAsDouble: Double = 0.0

    @State var exerciseDuration: String = ""
    @State var exerciseDurationAsDouble: Double = 0.0

    @State var exercisePointsAnswerAsDouble: Double = 0.0

    @State var selectedIntensity: String = ""

    let intensity = ["Lt", "Mod", "Hvy"]
    let intensityAsDouble = 0.0



    @Binding var addedExercisePointsTallyAsInt: Int



    @Environment(\.presentationMode) var presentationMode
    @State var exercisePointsAnswer: String = "______"



    var body: some View {
        
                      Form {

                          Group {
                              Text("CALCULATE EXERCISE POINTS").foregroundColor(.red)
                                                .font(.subheadline)
                                            HStack {
                                                Text("Your weight")
                                                    .foregroundColor(Color.cyan)
                                                    .frame(width: 150, height: 12, alignment: .leading)
                                                    .font(.subheadline)
                                                Spacer()
                                                TextField("", text: $weight)
                                                     .keyboardType(.numberPad)
                                                     .onSubmit {
                                                         weightAsDouble = Double(weight)!
                                                     }
                                                     .multilineTextAlignment(TextAlignment.center)
                                                     .border(Color.red)
                                                     .frame(width: 100, height: 12)
                                            }
                                            HStack {
                                                Text("Exercise Time")
                                                    .foregroundColor(Color.cyan)
                                                    .frame(width: 150, height: 12, alignment: .leading)
                                                    .font(.subheadline)
                                                Spacer()
                                                TextField("", text: $exerciseDuration)
                                                     .keyboardType(.numberPad)
                                                     .onSubmit {
                                                         exerciseDurationAsDouble = Double(exerciseDuration)!
                                                     }
                                                     .multilineTextAlignment(TextAlignment.center)
                                                     .border(Color.red)
                                                     .frame(width: 100, height: 12)
                                            }
                                            HStack {

                                                Text("Exercise Level")
                                                    .foregroundColor(Color.cyan)
                                                    .frame(width: 150, height: 12, alignment: .leading)
                                                    .font(.subheadline)
                                                Spacer()
                                                    Picker("Exercise Level", selection: $selectedIntensity) {
                                                                   ForEach(intensity, id: \.self) { intensity in
                                                                       Text(intensity).foregroundColor(Color.red)


                                                                   }
                                                    }.pickerStyle(SegmentedPickerStyle())
                                                                   .frame(width: 150, height: 12)
                                                                   .foregroundColor(Color.red)


                                                               Spacer()
                                                }

                                            HStack {
                                                    Button("CALCULATE") {
                                                        self.weightAsDouble =       Double(self.weight) ?? 0
                                                        self.exerciseDurationAsDouble =     Double(self.exerciseDuration) ?? 0

                                                        var factor = 0.0
                                                        if selectedIntensity == "Lt" {
                                                            factor = 0.000232
                                                        } else if selectedIntensity == "Mod" {
                                                            factor = 0.000327
                                                        } else {
                                                            factor = 0.0008077
                                                        }
                                                        addedExercisePointsTallyAsInt = 0
                                                        exercisePointsAnswerAsDouble = (weightAsDouble) * (exerciseDurationAsDouble) * (factor)
                                                        let roundedAnswer = Int(round(exercisePointsAnswerAsDouble))
                                                        exercisePointsAnswer = String(roundedAnswer)
                                                        print(selectedIntensity)
                                                        addedExercisePointsTallyAsInt = addedExercisePointsTallyAsInt + roundedAnswer


                                                    }
                                                    .foregroundColor(Color.cyan)
                                                    .font(.subheadline)
                                                    .frame(width: 175, height: 12, alignment: .leading)

                                                Spacer()
                                                Text("\(exercisePointsAnswer)")
                                                
                                                    .frame(width: 150, height: 12)
                                                    .foregroundColor(Color.red)
                                            }.onAppear() {
                                                addedExercisePointsTallyAsInt = 0
                                            }
                                  .padding(.bottom, 10)
                          }.padding(.leading, 10)

                      }
                      .padding(.top, 100)
                      .frame( alignment: .center)
    }


}

    struct AddExerciseView_Previews: PreviewProvider {
        static var previews: some View {
            AddExerciseView(addedExercisePointsTallyAsInt: .constant(0))
        }
    }



