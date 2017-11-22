//
//  RMahasiswaViewController.swift
//  Mahasiswa
//
//  Created by muqorrobin aimar on 11/22/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RMahasiswaViewController: UIViewController {

    @IBOutlet weak var etNim: UITextField!
    @IBOutlet weak var etNama: UITextField!
    @IBOutlet weak var etJurusan: UITextField!
    @IBOutlet weak var etAlamat: UITextField!
    @IBOutlet weak var etNilai: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        let nilaiNim = etNim.text!
        let nilaiNama = etNama.text!
        let nilaiJurusan = etJurusan.text!
        let nilaiAlamat = etAlamat.text!
        let nilaiNilai = etNilai.text!
        
        if ((nilaiNim.isEmpty) || (nilaiNilai.isEmpty) || (nilaiNama.isEmpty) || (nilaiAlamat.isEmpty) || (nilaiJurusan.isEmpty)){
            
            //muncul alert dialog
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            //apabila widget tidak kosong
            //membuat parameter untuk di simpan ke database
            let params = ["nim" : nilaiNim,
                          "nama_mahasiswa" : nilaiNama,
                          "alamat" : nilaiAlamat,
                          "nilai" : nilaiNilai,
                          "jurusan" : nilaiJurusan]
            //mencetak nilai params yang dikirim
            print(params)
            
            let url  = "http://localhost/Mahasiswa/index.php/Api/daftar"
            
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

