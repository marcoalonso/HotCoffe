//
//  DetailOrderViewController.swift
//  HotCoffe
//
//  Created by Marco Alonso Rodriguez on 03/01/23.
//

import UIKit

class DetailOrderViewController: UIViewController {
    
    var coffeOrder: OrderViewModel?

    @IBOutlet weak var coffeeEmailClient: UILabel!
    @IBOutlet weak var coffeeClient: UILabel!
    @IBOutlet weak var coffeSize: UILabel!
    @IBOutlet weak var coffeeName: UILabel!
    @IBOutlet weak var coffeeLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    private func setupUI(){
        print("Debug: coffeOrder \(coffeOrder?.type.lowercased() ?? "raf")")
        coffeeLogo.layer.cornerRadius = 25
        
        coffeeLogo.image = UIImage(named: "\(coffeOrder?.type.lowercased() ?? "raf")")
        coffeSize.text = "size: \(coffeOrder?.size.lowercased() ?? "")"
        coffeeName.text = "Coffee: \(coffeOrder?.type.lowercased() ?? "")"
        coffeeClient.text = "client: \(coffeOrder?.name ?? "")"
        coffeeEmailClient.text = "email: \(coffeOrder?.email ?? "")"
    }
    
    func mostrarAlerta(titulo: String, mensaje: String) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "OK", style: .default) { _ in
            //Do something
        }
        alerta.addAction(accionAceptar)
        present(alerta, animated: true)
    }
    
    @IBAction func payAction(_ sender: Any) {
       mostrarAlerta(titulo: "Total to Pay", mensaje: "$55.60")
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
