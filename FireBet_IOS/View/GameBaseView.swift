//
//  GameBaseView.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/21/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import UIKit

protocol GameBaseViewDelegate {
    func didTappedRoomIn()
}

class GameBaseView: UIView {
    var delegate: GameBaseViewDelegate?
    
    @IBOutlet weak var gameTypeIv: UIImageView!
    @IBOutlet weak var gameTypeLbl: UILabel!
   
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var firstResultLbl: UILabel!
    
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var secondResultLbl: UILabel!
    
    @IBOutlet weak var thirdLbl: UILabel!
    @IBOutlet weak var thirdResultLbl: UILabel!
    
    @IBOutlet weak var forthLbl: UILabel!
    @IBOutlet weak var forthResultLbl: UILabel!
    
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commitInit()
    }
    
    func commitInit(){
        Bundle.main.loadNibNamed("GameBaseView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func roomInTapped(_ sender: Any) {
        delegate?.didTappedRoomIn()
    }
}
