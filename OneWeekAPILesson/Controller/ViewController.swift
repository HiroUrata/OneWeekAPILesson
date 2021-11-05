//
//  ViewController.swift
//  OneWeekAPILesson
//
//  Created by UrataHiroki on 2021/11/05.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showRankingButton: UIButton!
    
    private let alamofire = Alamofire()
    private let indicator = Indicator()
    
    private var cellContentsArray = [AlamofireDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.register(UINib(nibName: "TableViewCustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func showRanking(_ sender: UIButton) {
        
        indicator.showIndicator(targetView: self.view)
        alamofire.getAPIDatas { getData, error in
            
            if error != nil{
                
                return
            }
            
            guard let data = getData else { return }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {[self] in
                
                cellContentsArray = []
                cellContentsArray = data
                indicator.indicatorView.stopAnimating()
                tableView.reloadData()
            }
        }
    }
    
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.height * 0.5
    }
}


extension ViewController:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(cellContentsArray.count)
        return cellContentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCustomCell
        
//        let cellRankLabel = cell.contentView.viewWithTag(1) as! UILabel
//        let cellImageView = cell.contentView.viewWithTag(2) as! UIImageView
//        let cellRecipeTitle = cell.contentView.viewWithTag(3) as! UILabel
        
//        cellRankLabel.text = "\(cellContentsArray[indexPath.row].rank ?? "読み込みERROR")位"
//        cellImageView.sd_setImage(with: URL(string: cellContentsArray[indexPath.row].mediumImageUrl!), completed: nil)
//        cellRecipeTitle.text = cellContentsArray[indexPath.row].recipeTitle
        cell.rankLabel.text = "\(cellContentsArray[indexPath.row].rank ?? "読み込みERROR")位"
        cell.mediumImageView.sd_setImage(with: URL(string: cellContentsArray[indexPath.row].mediumImageUrl!), completed: nil)
        cell.recipeTitleLabel.text = cellContentsArray[indexPath.row].recipeTitle
        
        return cell
    }
    
    
}
