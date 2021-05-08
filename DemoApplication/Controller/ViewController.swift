//
//  ViewController.swift
//  DemoApplication
//
//  Created by SAGAR THAKARE on 08/05/21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    //MARK:- Outlet's
    @IBOutlet weak var tblDetailInfo: UITableView!
    
    //MARK:- Variable's
    var arrDetailDataInfo     = [Result]()
    let decoder               = JSONDecoder()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }
    
    //MARK:- UI Configuration
    func configUI() {
        self.configTableView()
        self.getDetailsInfoData()
    }
    
    //  1. Configuration of UITableView
    func configTableView() {
        
        self.tblDetailInfo.register(UINib(nibName: "DataInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "DataInfoTableViewCell")
        
        self.tblDetailInfo.dataSource     = self
        self.tblDetailInfo.delegate       = self
        self.tblDetailInfo.separatorStyle = .none
    }
    //  2. API Call
    func getDetailsInfoData() {
        
        let session = URLSession.shared
        let url = URL(string: "https://swapi.dev/api/planets/")!
        
        startLoading(tblView: tblDetailInfo)
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            do {
                let weatherData = try self.decoder.decode(DataModelDetailInfo.self, from: data!)
                print(weatherData)
                self.arrDetailDataInfo = weatherData.results ?? []
                
                DispatchQueue.main.async {
                    self.tblDetailInfo.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        })
        stopLoading(tblView: tblDetailInfo)
        task.resume()
    }
}

//MARK:- TableView Delegate & Datasource
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrDetailDataInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblDetailInfo.dequeueReusableCell(withIdentifier: "DataInfoTableViewCell", for: indexPath) as! DataInfoTableViewCell
        
        let data = self.arrDetailDataInfo[indexPath.row]
        cell.lblName.text = data.name ?? ""
        
        return cell
    }
}

