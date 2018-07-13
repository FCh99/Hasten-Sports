//
//  TableViewController.swift
//  Hasten Sports
//
//  Created by Fausto Checa on 12/7/18.
//  Copyright © 2018 Fausto Checa. All rights reserved.
//

import UIKit


class MainTableViewController: UITableViewController {
    
    
    var numDeportes = 4
   
    
    var sportSections: [String] = []
    var playersAll: [[String]] = []
    
    var futbolArray: [[String]] = []
    var golfArray: [[String]] = []
    var tenisArray: [[String]] = []
    var formulaArray: [[String]] = []
    
    
     var arrayElegido: [[String]] = []
    
    var nameSelected = ""
    var surnameSelected = ""
    var imageSelected = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://api.myjson.com/bins/66851"
        
        
        if let url = URL(string: urlString) {
            
            if let data = try? String(contentsOf: url) {
                
                let json = JSON(parseJSON: data)
                
                for(_, object) in json {
                   let title = object["title"].stringValue
                    sportSections.append(title)
                  
                    let players = object["players"].arrayValue
                    
                    for player in players {
                        
                        let name = player["name"].stringValue
                        let surname = player["surname"].stringValue
                        let image = player["image"].stringValue
                        
                        let array: [String] = [name, surname, image, title]
                        playersAll.append(array)
                        
                    }
                }
            }
        }
        
        print(sportSections)
        print("--------->")
        // print(playersAll)
        
        for player in playersAll {
            switch player[3] {
                case "Football":
                    futbolArray.append(player)
                case "Tennis":
                    tenisArray.append(player)
                case "Golf":
                    golfArray.append(player)
                default:
                    formulaArray.append(player)
            }
        }
        //print("-------->")
        //print(golfArray)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sportSections.count
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
   
        switch section {
            case 0:
                arrayElegido = futbolArray
            case 1:
                arrayElegido = tenisArray
            case 2:
                 arrayElegido = golfArray
            default:
                 arrayElegido = formulaArray
        }
        
        return arrayElegido.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        switch indexPath.section {
        case 0:
            arrayElegido = futbolArray
        case 1:
            arrayElegido = tenisArray
        case 2:
            arrayElegido = golfArray
        default:
            arrayElegido = formulaArray
        }
        
            cell.nombreLabel.text = arrayElegido[indexPath.row][0]
            cell.surnameLabel.text = arrayElegido[indexPath.row][1]
            cell.myImageView.imageFromServerURL(urlString: arrayElegido[indexPath.row][2])
    
        
            return cell
    }
    
    // Delegate
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(integerLiteral: 80)
    }
    
    
    // Delegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView = UIView()
        myView.backgroundColor = UIColor.orange
        
        let myLabel = UILabel()
        let font = UIFont.boldSystemFont(ofSize: 22)
        myLabel.font = font
        
        myLabel.textAlignment = .center
        myLabel.text = self.sportSections[section]  // <<<<<<
        myLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 80)
        
        myView.addSubview(myLabel)
        return myView
        
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueId" {
            let vcDest = segue.destination as! DetailViewController
            
            guard let indexP = tableView.indexPathForSelectedRow else {return}
            let indexPSection = indexP.section
            
            switch indexPSection {
            case 0:
                arrayElegido = futbolArray
                imageSelected = "Futbol"
            case 1:
                arrayElegido = tenisArray
                imageSelected = "Tenis"
            case 2:
                arrayElegido = golfArray
                imageSelected = "Golf"
            default:
                arrayElegido = formulaArray
                imageSelected = "Formula"
            }
            
            
            let nameA = arrayElegido[(indexP.row)][0]
            let surnameA = arrayElegido[(indexP.row)][1]
            
            vcDest.name = nameA
            vcDest.surname = surnameA
            vcDest.imageString = imageSelected
            
            
        }
    }
   

}


extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
