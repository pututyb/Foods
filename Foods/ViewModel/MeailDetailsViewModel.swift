//
//  MealDetailViewModel.swift
//  Foods
//
//  Created by Putut Yusri Bahtiar on 04/09/23.
//

import Foundation
import Alamofire

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    
    func fetchMealDetail(forMealId mealId: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else { return }
        
        AF.request(url)
            .validate()
            .responseDecodable(of: MeailDetailRepsonse.self) { [weak self] response in
                switch response.result {
                case .success(let mealDetailResponse):
                    self?.mealDetail = mealDetailResponse.meals.first
                case .failure(let error):
                    print("Error fetching meal detail: \(error)")
                }
            }
    }
}
