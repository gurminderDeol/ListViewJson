//
//  ViewController.swift
//  custom
//
//  Created by Kiran Mehal on 2019-03-14.
//  Copyright © 2019 Kiran Mehal. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0
        {
            switch indexPath.row {
            case 0:
                print("Go to Home")
                
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let studentDetailsVC = sb.instantiateViewController(withIdentifier: "studentid") as! HomeViewController
                
                self.navigationController?.pushViewController(studentDetailsVC, animated: true)
            case 1:
                print("Go to Products Page")
            case 2:
                print("Go to Order History Page")
            default:
                print("Invalid Option")
            }
        }
        else
        {
            switch indexPath.row {
            case 0:
                print("Go to Help Page")
            case 1:
                print("Go to About US Page")
            case 2:
                print("Go to Contact US Page")
            case 3:
                print("Call Logout")
            default:
                print("Invalid Option")
            }
        }
    }


}

