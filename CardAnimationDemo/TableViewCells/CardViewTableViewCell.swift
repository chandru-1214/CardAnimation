//
//  CardViewTableViewCell.swift
//  AnimationDemo
//
//  Created by Chandru on 09/09/23.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var downloadView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    func configureCell() {
        mainView.setCornerRadius(radius: 30)
        selectionStyle = .none
    }
    
}
