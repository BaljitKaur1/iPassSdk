//  Reachability.swift
//  Created by CS on 24/01/23.

import Foundation
import Alamofire

class Reachability {
    class var isConnectedToInternet : Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
