//
//  MataViewController.swift
//  Mahasiswa
//
//  Created by muqorrobin aimar on 11/21/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit

class MataViewController: UIViewController {
    @IBOutlet weak var Id: UILabel!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var jumlah: UILabel!
    
    var passID:String?
    var passNama:String?
    var passJumlah:String?
    
    override func viewDidLoad() {
        Id.text = passID
        nama.text = passNama
        jumlah.text = passJumlah
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
