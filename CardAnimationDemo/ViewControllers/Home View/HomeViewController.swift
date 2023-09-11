//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Chandru on 08/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardsTableView: UITableView!
    
    var cardViewsCount = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
       
    }
    
    
    /// Method to regitser table view celld
    private func registerTableViewCells() {
        cardsTableView.separatorStyle = .none
        cardsTableView.register(UINib(nibName: TableViewCellId.cardViewTableViewCell, bundle: nil),
                                forCellReuseIdentifier: TableViewCellId.cardViewTableViewCell)
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardViewsCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cardCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellId.cardViewTableViewCell, for: indexPath) as! CardViewTableViewCell
        cardCell.configureCell()
        return cardCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetailsView(indexPath: indexPath)
    }
    
    
    /// Method to navigate card details view controller
    /// - Parameter indexPath: Denotes indexpath of selcted card
    func navigateToDetailsView(indexPath: IndexPath) {
        let cell = cardsTableView.cellForRow(at: indexPath) as! CardViewTableViewCell
        let detailVC = CardDetailViewController(nibName: ViewControllerId.cardDetailViewController, bundle: nil)
        //passing selected card views postion to card detail view controller
        detailVC.initialTopViewFrame = cell.topView.globalFrame
        detailVC.intialTitleLabelFrame = titleLabel.globalFrame
        detailVC.initialDownloadViewFrame = cell.downloadView.globalFrame
        detailVC.modalPresentationStyle = .overCurrentContext
        present(detailVC, animated: false)
    }
    
    
}

