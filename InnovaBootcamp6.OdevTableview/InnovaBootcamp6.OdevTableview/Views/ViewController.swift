//
//  ViewController.swift
//  InnovaBootcamp6.OdevTableview
//
//  Created by Merve Çalışkan on 2.10.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var faturaOdeLabel: UILabel!
    @IBOutlet weak var bubbleImage: UIImageView!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var colorStackImage: UIImageView!
    @IBOutlet weak var greenBackgroundView: UIView!
    @IBOutlet weak var faturaTipiLabel: UILabel!
    @IBOutlet weak var tableViewEnpara: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var downIcon: UIImageView!
    @IBOutlet weak var letterImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    
    var faturaTipleri = [FaturaTipi]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.layer.cornerRadius = 3
        headerView.layer.borderWidth = 0.5
        headerView.layer.borderColor = UIColor.hesaplarClr.cgColor
        
        tableViewEnpara.dataSource = self
        tableViewEnpara.delegate = self
        
          faturaTipleri = [
            FaturaTipi(faturaAdi: "Cep telefonu"),
            FaturaTipi(faturaAdi: "Diğer Telekomünikasyon"),
            FaturaTipi(faturaAdi: "Televizyon"),
            FaturaTipi(faturaAdi: "Doğalgaz"),
            FaturaTipi(faturaAdi: "Elektrik"),
            FaturaTipi(faturaAdi: "Su")
          ]

    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faturaTipleri.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "FaturaHucre") as! FaturaHucre
        let fatura = faturaTipleri[indexPath.row]
        hucre.labelFaturaAd.text = fatura.faturaAdi
        return hucre
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fatura = faturaTipleri[indexPath.row]
        performSegue(withIdentifier: "detayGecis", sender: fatura)
        print("\(fatura.faturaAdi) secildi")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

