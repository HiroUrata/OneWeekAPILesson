//
//  Alamofire.swift
//  OneWeekAPILesson02
//
//  Created by UrataHiroki on 2021/11/05.
//

import Alamofire
import SwiftyJSON

class Alamofire{
    
    private var afResultDataArray = [AlamofireDataModel]()
    private var recipeMaterialContents:[String]?
}

extension Alamofire{
    
    public func getAPIDatas(compltion: @escaping ([AlamofireDataModel]?,Error?) -> Void){
        
        let apiKey = ""
        
        AF.request(apiKey, method: .get, parameters: nil, encoding: JSONEncoding.default).response {[self] (response) in
            
            switch response.result{
                
            case .success:
                afResultDataArray = []
                
                let data = JSON(response.data as Any)
                
                for getCount in 0..<data["result"].count{
                    
                    if (data["result"][getCount]["rank"].string! != "" &&
                        data["result"][getCount]["mediumImageUrl"].string != "" &&
                        data["result"][getCount]["recipeTitle"].string != "") == true{
                        
                        
                        afResultDataArray.append(AlamofireDataModel(rank: data["result"][getCount]["rank"].string,
                                                                    mediumImageUrl: data["result"][getCount]["mediumImageUrl"].string,
                                                                    recipeTitle: data["result"][getCount]["recipeTitle"].string))
                    }
                    
                }
                return compltion(afResultDataArray,nil)
                
            case .failure(let error):
                
                return compltion(nil, error)
            }
        }
        
    }
}
