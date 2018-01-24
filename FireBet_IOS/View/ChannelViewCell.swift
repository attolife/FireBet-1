//
//  ChannelViewCell.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/21/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import UIKit

protocol ChannelViewCellDelegate {
    func didTappedRoomIn(cell: ChannelViewCell)
}

class ChannelViewCell: UICollectionViewCell {
    var delegate: ChannelViewCellDelegate?
    
    @IBOutlet weak var titleBt: UIButton!
    @IBOutlet weak var minBt: UIButton!
    @IBOutlet weak var maxBt: UIButton!
    @IBOutlet weak var minLbl: UILabel!
    @IBOutlet weak var maxLbl: UILabel!
    @IBOutlet weak var joinGameBt: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commitInit()
    }
    
    var channel: ChannelData? {
        didSet{
           titleBt.setTitle(channel?.title, for: .normal)
            minLbl.text = channel?.min
            maxLbl.text = channel?.max
        }
    }
    
    func commitInit(){
        Bundle.main.loadNibNamed("ChannelViewCell", owner: self, options: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func joinGameTapped(_ sender: Any) {
        delegate?.didTappedRoomIn(cell: self)
    }
}
