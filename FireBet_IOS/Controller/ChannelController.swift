//
//  ChannelController.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/21/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import UIKit
import SnapKit

class ChannelController: NSObject {    
    var mainController: MainController?
    var channels: [ChannelData] = []
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(white: 0, alpha: 0)
//        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let cellID = "CellID"
    
    let blackView = UIView()
    
    lazy var closeBt: UIButton = {
        let bt = UIButton()
        bt.showsTouchWhenHighlighted = true
        bt.clipsToBounds = true
        bt.setBackgroundImage(UIImage(named: "btn_pop_close"), for: .normal)
        bt.addTarget(self, action: #selector(dismissBlackView), for: .touchUpInside)
        return bt
    }()
    
    @objc func dismissBlackView(){
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0.0
            self.collectionView.alpha = 0.0
            self.closeBt.alpha = 0.0
        }
    }
    
    override init(){
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: "ChannelViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellID)
    }
    
    func showChannels(){
        if let window = UIApplication.shared.keyWindow {
            
            // Add blackView
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1.0
            })
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissBlackView)))
            
            // add collectionview
            window.addSubview(collectionView)
            collectionView.alpha = 0.0
            
            collectionView.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
                make.width.equalTo(window.frame.width*0.85)
                make.height.equalTo(window.frame.height*0.5)
            })
            
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.collectionView.alpha = 1.0
            }, completion: nil)
            
            // Add close button
            window.addSubview(closeBt)
            closeBt.snp.makeConstraints({ (make) in
                make.bottom.right.equalToSuperview().offset(-16)
                make.width.equalTo(101)
                make.height.equalTo(37)
            })
            
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                self.closeBt.alpha = 1.0
            }, completion: nil)
        }
    }
}

extension ChannelController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ChannelViewCellDelegate {
    func didTappedRoomIn(cell: ChannelViewCell) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            self.collectionView.alpha = 0
            self.closeBt.alpha = 0
        }) { (completion) in
            guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
            let channel = self.channels[indexPath.item]
            print("Channel: \(channel.title) tapped!")
            
            self.mainController?.showGameController()
        }
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ChannelViewCell
        cell.channel = channels[indexPath.item]
        cell.delegate = self
        setupStyles(cell: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width*0.28, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func setupStyles(cell: ChannelViewCell){
        cell.titleBt.layer.cornerRadius = 6
        cell.minBt.layer.cornerRadius = 6
        cell.maxBt.layer.cornerRadius = 6
        cell.joinGameBt.layer.cornerRadius = 6
        
    }
}
