//
//  ConnectivityService.swift
//  FlowMovie
//
//  Created by kareem chetoos on 25/11/2022.
//

import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
