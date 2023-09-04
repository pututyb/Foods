//
//  MealDetailView.swift
//  Foods
//
//  Created by Putut Yusri Bahtiar on 04/09/23.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI

struct MealDetailView: View {
    let mealId: String
    @ObservedObject var viewModel = MealDetailViewModel()
    
    var navigationTitle: String {
        viewModel.mealDetail?.strMeal ?? "Meal Detail"
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if let mealDetail = viewModel.mealDetail {
                    WebImage(url: URL(string: mealDetail.strMealThumb))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .cornerRadius(8)
                    
                    Text("Category: \(mealDetail.strCategory)")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    ScrollView {
                        Text("Instructions: \(mealDetail.strInstructions)")
                            .font(.body)
                            .padding()
                    }
                    
                    if let sourceURL = URL(string: mealDetail.strSource) {
                        Link("Source: \(mealDetail.strSource)", destination: sourceURL)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                    
                } else {
                    Text("Loading meal detail...")
                        .font(.headline)
                }
            }
        }
        .onAppear {
            viewModel.fetchMealDetail(forMealId: mealId)
        }
        .navigationBarTitle(navigationTitle, displayMode: .inline)
    }
}


struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealId: "53043")
    }
}
