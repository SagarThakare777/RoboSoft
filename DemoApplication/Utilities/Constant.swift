//
//  Constant.swift
//  DemoApplication
//
//  Created by SAGAR THAKARE on 08/05/21.
//

import UIKit
import Foundation


//  1. Activity Indicator View
var activityIndicationView: UIActivityIndicatorView = {
    let activityIndicationView = UIActivityIndicatorView(style: .medium)
    activityIndicationView.color = .white
    activityIndicationView.backgroundColor = .darkGray
    activityIndicationView.layer.cornerRadius = 5.0
    activityIndicationView.hidesWhenStopped = true
    activityIndicationView.translatesAutoresizingMaskIntoConstraints = false
    return activityIndicationView
}()

//  2. Start Loading Indicator View
func startLoading(tblView: UITableView) {
    tblView.isUserInteractionEnabled = false
    activityIndicationView.isHidden = false
    activityIndicationView.startAnimating()
}

//  3. Stop Loading Indicator View
func stopLoading(tblView: UITableView) {
    DispatchQueue.main.async {
        tblView.isUserInteractionEnabled = true
        activityIndicationView.stopAnimating()
        activityIndicationView.isHidden = true
    }
}
