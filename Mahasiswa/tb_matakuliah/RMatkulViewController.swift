//
//  RMatkulViewController.swift
//  Mahasiswa
//
//  Created by muqorrobin aimar on 11/22/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RMatkulViewController: UIViewController {
    
    @IBOutlet weak var etId: UITextField!
    @IBOutlet weak var etNama: UITextField!
    @IBOutlet weak var etJumlah: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        let nilaiId = etId.text!
        let nilaiJumlah = etJumlah.text!
        let nilaiNama = etNama.text!
        
        
        if ((nilaiId.isEmpty) || (nilaiNama.isEmpty) || (nilaiJumlah.isEmpty)) {
            
            //muncul alert dialog
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            //apabila widget tidak kosong
            //membuat parameter untuk di simpan ke database
            let params = ["id_matkul" : nilaiId,
                          "nama_matkul" : nilaiNama,
                          "jumlah_sks" : nilaiJumlah,
                          ]
            //mencetak nilai params yang dikirim
            print(params)
            
            let url  = "http://localhost/Mahasiswa/index.php/Api/daftar3"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    //muncul alert dialog
                    let alertWarning = UIAlertController(title: "Congrats", message: "Data berhasil disimpan", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion: nil)
                    
                }
                
            })
        }
    }
}



