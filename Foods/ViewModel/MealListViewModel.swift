//
//  MealListViewModel.swift
//  Foods
//
//  Created by Putut Yusri Bahtiar on 04/09/23.
//

import Foundation
import Alamofire
import SwiftUI

class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []

    func fetchMeals() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood") else { return }

        AF.request(url)
            .validate()
            .responseDecodable(of: MealsResponse.self) { [weak self] response in
                switch response.result {
                case .success(let mealsResponse):
                    self?.meals = mealsResponse.meals
                case .failure(let error):
                    print("Error fetching meals: \(error)")
                }
            }
    }
}
