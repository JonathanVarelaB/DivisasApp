//
//  ViewController.swift
//  DivisasApp
//
//  Created by Jonathan Varela on 4/27/18.
//  Copyright © 2018 Jonathan Varela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var precioBitcoin: Int = 100
    var bitcoinsComprados: Int = 0
    var cambioDeCompra: Int = 0
    
    @IBOutlet weak var dolares: UITextField!
    @IBOutlet weak var bitcoinsAcumulado: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func comprar(_ sender: UIButton) {
        if self.dolares.text != nil && self.dolares.text != "" {
            self.compraFinal(dolaresCompra: Int(self.dolares.text!)!)
            // abrir pantalla con resultados, se envia bitcoinsComprados y cambioDeCompra
        }
    }
    
    func calculoCompra(dolaresCalculo: Int) -> Int{
        return dolaresCalculo / self.precioBitcoin
    }
    
    func compraFinal(dolaresCompra: Int){
        if self.precioBitcoin > 0 {
            self.bitcoinsComprados = self.calculoCompra(dolaresCalculo: dolaresCompra)
            if bitcoinsComprados > 0{
                self.cambio(dolaresCambio: dolaresCompra)
            }
        }
    }
    
    func cambio(dolaresCambio: Int){
        self.cambioDeCompra = dolaresCambio % self.precioBitcoin
    }
 
    @IBAction func vistaPrevia(_ sender: UITextField) {
        var calculoPrevio: Int = 0
        if self.dolares.text != nil && self.dolares.text != "" {
            calculoPrevio = self.calculoCompra(dolaresCalculo: Int(self.dolares.text!)!)
            self.bitcoinsAcumulado.text = "\(calculoPrevio) bitcoins"
        }
        else{
            self.bitcoinsAcumulado.text = ""
        }
    }
    
}

