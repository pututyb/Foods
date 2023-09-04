//
//  ContentView.swift
//  Foods
//
//  Created by Putut Yusri Bahtiar on 04/09/23.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.meals, id: \.idMeal) { meal in
                NavigationLink(destination: MealDetailView(mealId: meal.idMeal)) {
                    HStack {
                        
                        WebImage(url: URL(string: meal.strMealThumb))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text(meal.strMeal)
                                .font(.headline)
                            Text(meal.idMeal)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchMeals()
            }
            .navigationTitle("Meals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
