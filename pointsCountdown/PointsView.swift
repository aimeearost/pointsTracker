//
//  ContentView.swift
//  pointsCountdown
//
//  Created by Aimee Arost on 1/23/22.
//

import SwiftUI

struct PointsView: View {


    @State var isSelected = false
    @State var isSelected2 = false
    @State var isSelected3 = false
    @State var thisSelection = false

    


    var body: some View {

        TabView {
            VStack {
                Text("ZERO POINT FOODS")
                    .font(.subheadline)
                    .foregroundColor(.red)
                Text("FRUITS")
                    .font(.subheadline)
                    .foregroundColor(.red)
                ScrollView {

                    Group {
                        Text("Apples")
                        Text("Applesauce, unsweetened")
                        Text("Apricots, fresh")
                        Text("Bananas")
                        Text("Blackberries")
                        Text("Blueberries")
                        Text("Cantaloupe")
                        Text("Cherries")
                        Text("Clementines")
                        Text("Cranberries, fresh")
                    }
                    Group {
                        Text("Dragon fruit")

                        Text("Figs, fresh")
                        Text("Frozen mixed berries, unsweetened")
                        Text("Fruit cocktail, unsweetened")
                        Text("Fruit salad, unsweetened")
                        Text("Grapefruit")
                        Text("Grapes")
                        Text("Guava")
                        Text("Honeydew")
                        Text("Kiwi")
                    }
                    Group {
                        Text("Kumquats")
                        Text("Lemons")
                        Text("Limes")
                        Text("Mangoes")
                        Text("Meyer lemons")
                        Text("Nectarines")
                        Text("Oranges")
                        Text("Papayas")
                        Text("Peaches")
                        Text("Pears")
                    }
                    Group {
                        Text("Persimmons")
                        Text("Pineapples")
                        Text("Plums")
                        Text("Pomegranates")
                        Text("Pomelo")
                        Text("Raspberries")
                        Text("Star fruit")
                        Text("Strawberries")
                        Text("Tangerines")
                        Text("Watermelon")
                    }

                }
            }.padding(.bottom, 50)
                .foregroundColor(.cyan)
//                .tabItem{
//                    Image(systemName: "1.square.fill")
//                    Text("Fruit")
//                }

            VStack {
                Text("ZERO POINT FOODS")
                    .font(.subheadline)
                    .foregroundColor(.red)
                Text("VEGETABLES")
                    .foregroundColor(.red)
                    .font(.subheadline)
                ScrollView {
                    Group{
                        Group {
                                 Text("Acorn squash")

                                 Text("Artichoke hearts, no oil")
                                 Text("Artichokes")
                                 Text("Arugula")
                                 Text("Asparagus")
                                 Text("Baby corn")
                                 Text("Bamboo shoots")
                                 Text("Basil")
                                 Text("Beet greens")
                                 Text("Beets")
                             }

                        Group {
                            Text("Bok choy")
                            Text("Broccoli")
                            Text("Broccoli rabe")
                            Text("Broccoli slaw")
                            Text("Brussels sprouts")
                            Text("Butter/Bibb lettuce")
                            Text("Butternut squash")
                            Text("Cabbage")
                            Text("Canned pimientos")
                            Text("Canned corn")
                        }

                        Group {
                            Text("Carrots")
                            Text("Cauliflower")
                            Text("Cauliflower rice")
                            Text("Celery")
                            Text("Chives")
                            Text("Cilantro")
                            Text("Coleslaw mix")
                            Text("Collard greens")
                            Text("Corn")
                            Text("Cucumber")
                        }

                        Group {
                            Text("Eggplant")
                            Text("Endive")
                            Text("Escarole")
                            Text("Fennel")
                            Text("Frozen stir-fry vegetables, no sauce")
                            Text("Garlic")
                            Text("Ginger")
                            Text("Green leaf lettuce")
                            Text("Hearts of palm")
                            Text("Jicama")
                        }

                        Group {
                            Text("Kale")
                            Text("Kohlrabi")
                            Text("Leeks")
                            Text("Mint")
                            Text("Mixed greens")
                            Text("Mushrooms")
                            Text("Mustard greens")
                            Text("Napa cabbage")
                            Text("Nori (seaweed)")
                            Text("Oak leaf lettuce")
                        }
                    }



                    Group {
                        Text("Okra")
                        Text("Onions")
                        Text("Oregano")
                        Text("Parsley")
                        Text("Parsnips")
                        Text("Green peas")
                        Text("Peas")
                        Text("Pea shoots")
                        Text("Peppers")
                        Text("Pickles, unsweetened")

                    }

                    Group {
                        Text("Okra")
                        Text("Onions")
                        Text("Oregano")
                        Text("Pico de gallo")
                        Text("Pumpkin")
                        Text("Pumpkin puree")
                        Text("Radishes")
                        Text("Red leaf lettuce")
                        Text("Romaine lettuce")
                        Text("Rosemary")

                    }

                    Group {
                        Text("Rutabaga")
                        Text("Salsa, fat-free")
                        Text("Split peas")
                        Text("Succotash")
                        Text("Canned corn")
                        Text("Corn")
                        Text("Green peas")
                        Text("Radishes")
                        Text("Red leaf lettuce")
                        Text("Romaine lettuce")
                    }

                    Group {
                        Text("Rosemary")
                        Text("Rutabaga")
                        Text("Salsa, fat-free")
                        Text("Sauerkraut")
                        Text("Scallions")
                        Text("Shallots")
                        Text("Spaghetti squash")
                        Text("Spinach")
                        Text("String beans")
                        Text("Summer squash")
                    }

                    Group {
                        Text("Swiss chard")
                        Text("Tarragon")
                        Text("Thyme")
                        Text("Tomatillos")
                        Text("Tomato puree, canned")
                        Text("Tomato sauce, canned")
                        Text("Tomatoes")
                        Text("Turnips")
                        Text("Water chestnuts")
                        Text("Wax beans")
                    }
                    Group {
                        Text("Zucchini")
                    }
                }
            }.padding(.bottom, 50)
                .foregroundColor(.cyan)
//                .tabItem {
//                    Image(systemName: "2.square.fill")
//                    Text("Vegetables")
//                }
            VStack {
                Text("ZERO POINT FOODS")
                    .font(.subheadline)
                    .foregroundColor(.red)
                Text("BEANS/LEGUMES")
                    .font(.subheadline)
                    .foregroundColor(.red)
                ScrollView {

                    Group {
                        Text("Adzuki beans")
                        Text("Alfalfa sprouts")
                        Text("Bean sprouts")
                        Text("Black beans")
                        Text("Black-eyed peas")
                        Text("Cannellini beans")
                        Text("Chickpeas")
                        Text("Edamame")
                        Text("Fava beans")
                        Text("Great Northern beans")
                    }
                    Group {
                        Text("Hominy")

                        Text("Kidney beans")
                        Text("Lentils")
                        Text("Lima beans")
                        Text("Lupini beans")
                        Text("Navy beans")
                        Text("Pinto beans")
                        Text("Refried beans, canned, fat-free")
                        Text("Soy beans")
                    }


                }
            }.padding(.bottom, 50)
                .foregroundColor(.cyan)
//                .tabItem{
//                    Image(systemName: "3.square.fill")
//                    Text("Beans/Legumes")
//                }
            VStack {
                Text("ZERO POINT FOODS")
                    .font(.subheadline)
                    .foregroundColor(.red)
                Text("PASTA/GRAINS")
                    .font(.subheadline)
                    .foregroundColor(.red)
                ScrollView {

                    Group {
                        Text("Air-popped popcorn")
                        Text("Amaranth Ancient grain mix - no seeds").multilineTextAlignment(.center)
                        Text("Barley")
                        Text("Black bean pasta")
                        Text("Brown basmati rice")
                        Text("Brown rice")
                        Text("Brown rice cereal, 100%")
                        Text("Brown rice noodles")
                        Text("Brown rice pasta")
                    }
                    Group {
                        Text("Brown rice–quinoa blend")

                        Text("Buckwheat")
                        Text("Buckwheat soba noodles")
                        Text("Bulgur")
                        Text("Chickpea pasta")
                        Text("Corn pasta")
                        Text("Edamame pasta")
                        Text("Farro")
                        Text("Freekeh")
                           Text("Instant brown rice")
                    }
                    Group {
                        Text("Instant oatmeal, plain")

                        Text("Kamut")
                        Text("Kasha")
                        Text("Lentil pasta")
                        Text("Millet Oatmeal, plain")
                        Text("Oats")
                        Text("Pea pasta")
                        Text("Popcorn kernels")
                        Text("Quick-cooking barley")
                        Text("Quick-cooking brown rice")

                    }
                    Group {
                        Text("Quick-cooking regular oats")

                        Text("Quick-cooking steel-cut oats")
                        Text("Quinoa")
                        Text("Quinoa pasta")
                        Text("Red quinoa")
                        Text("Rolled oats")
                        Text("Rye berries")
                        Text("Shirataki noodles")
                        Text("Sorghum")
                        Text("Soybean pasta")

                    }
                    Group {
                        Text("Spelt")

                        Text("Spelt berries")
                        Text("Steel-cut oats")
                        Text("Teff")
                        Text("Thai brown rice")
                        Text("Tri-color quinoa")
                        Text("Wheat berries")
                        Text("Whole-grain pasta")
                        Text("Whole-grain sorghum")
                        Text("Whole-wheat couscous")

                    }
                    Group {
                        Text("Whole-wheat pasta")

                        Text("Wild rice")
                        Text("Wild rice–brown rice blend")


                    }

                }
            }.padding(.bottom, 50)
                .foregroundColor(.cyan)
      
            
            Text("Beans/Legumes")

            Text("Another Tab")

            Text("The Last Tab")
        }
        .tabViewStyle(PageTabViewStyle())
        .font(.headline)
        .accentColor(.red)
        .padding()
    }


    struct PointsView_Previews: PreviewProvider {
        static var previews: some View {
            PointsView()
        }
    }
}


