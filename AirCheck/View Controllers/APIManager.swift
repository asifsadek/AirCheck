//
//  APIManager.swift
//  AirCheck
//
//  Created by Jorge Raul Ovalle Zuleta on 4/23/16.
//  Copyright © 2016 aircheck. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    static let sharedInstance = APIManager()
    
    let plainURL = "http://aircheck.cloudapp.net:8080/"
    
    override init() {
        super.init()
    }
    
    func getAllReports(){
        let url = plainURL+"report/"
        Alamofire.request(.GET, url)
            .responseJSON { _, _, result in
                if result.isSuccess{
                    if let value = result.value {
                        NSNotificationCenter.defaultCenter().postNotificationName("reportsLoaded", object: value)
                    }
                }
        }
    }
    
    func getPollutionReports(){
        let url = plainURL+"report/pollution"
        Alamofire.request(.GET, url)
            .responseJSON { _, _, result in
                if result.isSuccess{
                    if let value = result.value {
                        NSNotificationCenter.defaultCenter().postNotificationName("reportsLoaded", object: value)
                    }
                }
        }
    }
    
    func getSymptomsReports(){
        let url = plainURL+"report/syptoms"
        Alamofire.request(.GET, url)
            .responseJSON { _, _, result in
                if result.isSuccess{
                    if let value = result.value {
                        NSNotificationCenter.defaultCenter().postNotificationName("reportsLoaded", object: value)
                    }
                }
        }
    }
    
    func uploadReport(report:Report){
        let url = plainURL+"report/"
        Alamofire.request(.POST, url, parameters: report.toDictionary(), encoding: .JSON, headers: nil).responseJSON { [unowned self](_, _, result) -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName("reportCreated", object: true)
//            self.getAllReports()
        }
    }
}
