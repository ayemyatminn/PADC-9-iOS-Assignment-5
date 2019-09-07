//
//  ViewController.swift
//  HotelBookingPOC
//
//

import UIKit
import FittedSheets

class ViewController: UIViewController {

    @IBOutlet weak var hotelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let bottomSheet = SheetViewController(controller: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: BottomSheetViewController.self)),sizes: [.fixed(400),.fullScreen])
        
        self.present(bottomSheet, animated: true, completion: nil)
        
        
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        
        let hotelCell = UINib(nibName: String(describing: HotelTableViewCell.self), bundle: nil)
        hotelTableView.register(hotelCell, forCellReuseIdentifier: String(describing: HotelTableViewCell.self))
    }
}

extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HotelTableViewCell.self), for: indexPath) as! HotelTableViewCell
        return cell
    }
    
    
}

