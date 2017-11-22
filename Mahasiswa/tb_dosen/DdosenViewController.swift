//
//  DdosenViewController.swift
//  Mahasiswa
//
//  Created by muqorrobin aimar on 11/21/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit

class DdosenViewController: UIViewController {
    
    @IBOutlet weak var nip: UILabel!
    @IBOutlet weak var nim: UILabel!
    @IBOutlet weak var nama_dosen: UILabel!
    @IBOutlet weak var mata_kuliah: UILabel!
    @IBOutlet weak var alamat: UILabel!
    @IBOutlet weak var hp: UILabel!
    
    var passNip:String?
    var passNim:String?
    var passNamaD:String?
    var passMata:String?
    var passAlamatD:String?
    var passHp:String?

    override func viewDidLoad() {
        nim.text = passNim!
        nip.text = passNip!
        nama_dosen.text = passNamaD!
        alamat.text = passAlamatD!
        hp.text = passHp!
        mata_kuliah.text = passMata!
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
