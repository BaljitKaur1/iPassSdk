//  ApiStore.swift
//  Created by CS on 24/01/23.

import UIKit
import Alamofire
import PKHUD

class ApiStore : NSObject {
    
    // MARK: - Shared Instance
    static let shared = ApiStore()
    
    // MARK: - Functions
    func handleErrorCase(_ statusCode : Int?, _ dict : NSDictionary?) {
        let msg = dict?.value(forKey: "message") as? String
        print("msg->", msg)
        print("statusCode->",statusCode!)
        HUD.hide()
        
        if msg != nil {
            if msg == AppErrors.sessionExpire.localizedDescription {
                HUD.flash(.labeledError(title: "", subtitle: msg), onView: UIApplication.visibleViewController.view, delay: 1.5) { _ in
                }
            } else {
                HUD.show(.labeledError(title: "", subtitle: msg))
            }
        }
    }
    
    // -- To check whether the json is valid or not
    func isValidJson(check data: Data) -> Bool {
        do {
            if let _ = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                return true
            } else if let _ = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray {
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
    // MARK: - Base Request API
    func baseRequestApi<T: Codable>(_ url: URLConvertible, _ method : HTTPMethod, _ params: [String: Any]? = nil, _ headers: [String: String]? = nil, completion: @escaping (Result<T, K>) -> Void){
        
        print(method)
        print(url)
        print(params)
        print(headers)
        
        if Reachability.isConnectedToInternet {
            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers?.toHeader()) { $0.timeoutInterval = 10 }.validate().responseDecodable(of: T.self) { response in
                
                if response.data != nil {
                    if response.response?.statusCode == 200 {
                        do {
                            if let jsonData = response.data {
                                if self.isValidJson(check: jsonData) {
                                    do {
                                        let dataModel = try JSONDecoder().decode(T.self, from: jsonData)
                                        completion(dataModel)
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                    
                                } else {
                                    HUD.flash(.labeledError(title: "", subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    } else {
                        do {
                            if let jsonData = response.data {
                                if self.isValidJson(check: jsonData) {
                                    do {
                                        let dataModel = try JSONDecoder().decode(K.self, from: jsonData)
                                        completion(dataModel)
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                    
                                } else {
                                    HUD.flash(.labeledError(title: "", subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } else {
                    HUD.flash(.labeledError(title: "", subtitle: AppErrors.somethingWrong.localizedDescription), delay: 1.0)
                }
            }
        } else {
            HUD.flash(.labeledError(title: "", subtitle: AppErrors.internetConnection.localizedDescription), delay: 1.0)
        }
    }
}

// MARK: - Dictionary Extension
extension Dictionary where Key == String, Value == String {
    func toHeader() -> HTTPHeaders {
        var headers: HTTPHeaders = [:]
        for (key, value) in self {
            headers.add(name: key, value: value)
        }
        return headers
    }
}
