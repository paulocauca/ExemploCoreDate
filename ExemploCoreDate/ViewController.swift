//
//  ViewController.swift
//  ExemploCoreDate
//
//  Created by Paulo Cauca on 18/03/17.
//  Copyright © 2017 Paulo Cauca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var filmes:[String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    

    @IBAction func adicionar(_ sender: Any) {
        
        let alerta = UIAlertController(
                title: "Filme",
                message: "Digite seu filme!",
                preferredStyle: .alert)
        
        
        let salvar = UIAlertAction(
                title: "Salvar",
                style: .default,
                handler: {
                        action in
                        self.filmes.append((alerta.textFields?.first!.text)!)
                        self.tableView.reloadData()
                })
        
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        
        
        alerta.addTextField()
        alerta.addAction(salvar)
        alerta.addAction(cancelar)
        
        present(alerta, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favoritos"
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ReusableCell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        
        celula.textLabel?.text = filmes[indexPath.row]
        
        return celula
        
    }
    
    
    
}

