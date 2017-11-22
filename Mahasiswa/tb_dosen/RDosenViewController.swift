//
//  RDosenViewController.swift
//  Mahasiswa
//
//  Created by muqorrobin aimar on 11/22/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RDosenViewController: UIViewController {
    
    @IBOutlet weak var etNip: UITextField!
    @IBOutlet weak var etNama: UITextField!
    @IBOutlet weak var etMata: UITextField!
    @IBOutlet weak var etAlamat: UITextField!
    @IBOutlet weak var etHp: UITextField!
    @IBOutlet weak var etNim: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        let nilaiNim = etNim.text!
        let nilaiNip = etNip.text!
        let nilaiNama = etNama.text!
        let nilaiMata = etMata.text!
        let nilaiAlamat = etAlamat.text!
        let nilaiHp = etHp.text!
        
        if ((nilaiNim.isEmpty) || (nilaiNip.isEmpty) || (nilaiMata.isEmpty) || (nilaiNama.isEmpty) || (nilaiAlamat.isEmpty) || (nilaiHp.isEmpty)){
            
            //muncul alert dialog
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            //apabila widget tidak kosong
            //membuat parameter untuk di simpan ke database
            let params = ["nim" : nilaiNim, "nip" : nilaiNip,
                          "nama_dosen" : nilaiNama,
                          "alamat" : nilaiAlamat,
                          "mata_kuliah" : nilaiMata,
                          "hp" : nilaiHp]
            //mencetak nilai params yang dikirim
            print(params)
            
            let url  = "http://localhost/Mahasiswa/index.php/Api/daftar2"
            
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


