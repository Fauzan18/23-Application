//
//  MataTableViewController.swift
//  Mahasiswa
//
//  Created by muqorrobin aimar on 11/21/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MataTableViewController: UITableViewController {
    
    var IdSelected:String?
    var namaSelected:String?
    var jumlahSelected:String?
    
    
    
    var mahasiswa = [Mahasiswa]()
    var arrKar = [[String: AnyObject]]()//array data siswa
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //memanggil data json menggunakan alamofire
        Alamofire.request("http://localhost/Mahasiswa/index.php/Api/getMatkul").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.arrKar = resData as! [[String:AnyObject]]
                }
                if self.arrKar.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrKar.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user", for: indexPath) as! MataTableViewCell
        
        // Configure the cell...
        var dict = arrKar[indexPath.row]
        cell.nama.text = dict["nama_matkul"] as? String
        cell.jumlah.text = dict["jumlah_sks"] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arrKar[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
    
        namaSelected = task["nama_matkul"] as? String
        IdSelected = task["id_matkul"] as? String
        jumlahSelected = task["jumlah_sks"] as? String
       
        
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "passData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            //        let kirimData = segue.destination as! KontakViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! MataViewController
                let value = arrKar[indexPath.row]
                
                controller.passID = value["id_matkul"] as? String
                controller.passJumlah = value["jumlah_sks"] as? String
                controller.passNama = value["nama_matkul"] as? String
                
                
            }
        }
    }
}





