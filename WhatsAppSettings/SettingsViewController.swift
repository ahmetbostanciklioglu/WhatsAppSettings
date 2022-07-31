//
//  SettingsViewController.swift
//  WhatsAppSettings
//
//  Created by Ahmet Bostancıklıoğlu on 31.07.2022.
//

//MARK: - Warn:  Upload your image to profile in asset file, then compile project.

import UIKit

class SettingsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var settingsTableView: UITableView!
    
    var settingsArray = [["Starred Messages", "WhatsApp Web/Desktop"], ["Account", "Chats", "Notifications", "Data Storage and Usage"]]
    
    var imagesArray = [["starred", "web"], ["account", "chats", "notifications", "data"]]
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.profileTableView {
            return 1
        } else {
            return settingsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.profileTableView {
            return 1
        } else {
            return settingsArray[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == self.profileTableView) {
            let cellIdentifier = "ProfileTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ProfileTableViewCell
                cell.profileImage.image = UIImage(named: "profile") 
                cell.nameLabel.text = "Anonim"
                cell.statusLabel.text = "Inovation is excited"
                return cell
        } else {
            let cellIdentifier = "SettingsTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SettingsTableViewCell
            
            cell.settingsImage.image = UIImage(named: imagesArray[indexPath.section][indexPath.row])
            cell.settingsLabel.text = settingsArray[indexPath.section][indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == self.settingsTableView {
            return 50
        }
        return 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
    }
    


}
