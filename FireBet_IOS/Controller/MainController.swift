//
//  MainController.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/20/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import UIKit
import SnapKit

class MainController: UIViewController, GameBaseViewDelegate {
    var channels: [ChannelData] = []
    
    
    @IBOutlet weak var baseView: UIView!
    var gameViews: [UIView] = []
    var index: Int = 0
    
    var tablesData: [TableData] = []
    var tableData: TableData!
    
    func didTappedRoomIn() {
        fetchChannels()
        channelController.channels = channels
        channelController.collectionView.reloadData()
        
        channelController.showChannels()
    }
    
    lazy var channelController: ChannelController = {
        let channel = ChannelController()
        channel.mainController = self
        return channel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTableData()
        setupViews()
        
        fetchChannels()
        channelController.channels = channels
    }
    
    func fetchChannels(){
        channels.removeAll()
        switch index {
        case 0:
            let channel1 = ChannelData(dictionary: ["title": "BCC-CH01", "min": "50", "max": "500"])
            let channel2 = ChannelData(dictionary: ["title": "BCC-CH02", "min": "100", "max": "1000"])
            let channel3 = ChannelData(dictionary: ["title": "BCC-CH03", "min": "500", "max": "10000"])
            
            channels.append(channel1)
            channels.append(channel2)
            channels.append(channel3)
        case 1:
            let channel1 = ChannelData(dictionary: ["title": "DT-CH01", "min": "50", "max": "500"])
            let channel2 = ChannelData(dictionary: ["title": "DT-CH02", "min": "100", "max": "1000"])
            let channel3 = ChannelData(dictionary: ["title": "DT-CH03", "min": "500", "max": "10000"])
            
            channels.append(channel1)
            channels.append(channel2)
            channels.append(channel3)
        case 2:
            let channel1 = ChannelData(dictionary: ["title": "RLT-CH01", "min": "50", "max": "500"])
            let channel2 = ChannelData(dictionary: ["title": "RLT-CH02", "min": "100", "max": "1000"])
            let channel3 = ChannelData(dictionary: ["title": "RLT-CH03", "min": "500", "max": "10000"])
            
            channels.append(channel1)
            channels.append(channel2)
            channels.append(channel3)
        case 3:
            let channel1 = ChannelData(dictionary: ["title": "SB-CH01", "min": "50", "max": "500"])
            let channel2 = ChannelData(dictionary: ["title": "SB-CH02", "min": "100", "max": "1000"])
            let channel3 = ChannelData(dictionary: ["title": "SB-CH03", "min": "500", "max": "10000"])
            
            channels.append(channel1)
            channels.append(channel2)
            channels.append(channel3)
        default:
            break
        }
        
    }

    func fetchTableData(){
        let baccaratTbl = TableData(gameType: GameType.Baccarat, dictionary: [
            Constants.TblDataParamKeys.Name: "BCC-001",
            Constants.TblDataParamKeys.Icon: "icon_baccarat",
            Constants.TblDataParamKeys.FirstLbl: "ALL",
            Constants.TblDataParamKeys.FirstResult: "57",
            Constants.TblDataParamKeys.SecondLbl: "BANKER",
            Constants.TblDataParamKeys.SecondResult: "25",
            Constants.TblDataParamKeys.ThirdLbl: "PLAYER",
            Constants.TblDataParamKeys.ThirdResult: "25",
            Constants.TblDataParamKeys.ForthLbl: "TIE",
            Constants.TblDataParamKeys.ForthResult: "6"])
        
        let dtTbl = TableData(gameType: GameType.DragonTiger, dictionary: [
            Constants.TblDataParamKeys.Name: "DT-001",
            Constants.TblDataParamKeys.Icon: "icon_dragon_tiger",
            Constants.TblDataParamKeys.FirstLbl: "ALL",
            Constants.TblDataParamKeys.FirstResult: "22",
            Constants.TblDataParamKeys.SecondLbl: "DRAGON",
            Constants.TblDataParamKeys.SecondResult: "11",
            Constants.TblDataParamKeys.ThirdLbl: "TIGER",
            Constants.TblDataParamKeys.ThirdResult: "9",
            Constants.TblDataParamKeys.ForthLbl: "TIE",
            Constants.TblDataParamKeys.ForthResult: "1"])
        
        let rouletteTbl = TableData(gameType: GameType.Roulette, dictionary: [
            Constants.TblDataParamKeys.Name: "RL-001",
            Constants.TblDataParamKeys.Icon: "icon_roulette",
            Constants.TblDataParamKeys.FirstLbl: "ODD",
            Constants.TblDataParamKeys.FirstResult: "5",
            Constants.TblDataParamKeys.SecondLbl: "EVEN",
            Constants.TblDataParamKeys.SecondResult: "1",
            Constants.TblDataParamKeys.ThirdLbl: "BIG",
            Constants.TblDataParamKeys.ThirdResult: "0",
            Constants.TblDataParamKeys.ForthLbl: "SMALL",
            Constants.TblDataParamKeys.ForthResult: "0"])
        
        let sicboTbl = TableData(gameType: GameType.Sicbo, dictionary: [
            Constants.TblDataParamKeys.Name: "SB-001",
            Constants.TblDataParamKeys.Icon: "icon_sicbo",
            Constants.TblDataParamKeys.FirstLbl: "ODD",
            Constants.TblDataParamKeys.FirstResult: "9",
            Constants.TblDataParamKeys.SecondLbl: "EVEN",
            Constants.TblDataParamKeys.SecondResult: "3",
            Constants.TblDataParamKeys.ThirdLbl: "BIG",
            Constants.TblDataParamKeys.ThirdResult: "0",
            Constants.TblDataParamKeys.ForthLbl: "SMALL",
            Constants.TblDataParamKeys.ForthResult: "0"])
        
        tablesData.append(baccaratTbl)
        tablesData.append(dtTbl)
        tablesData.append(rouletteTbl)
        tablesData.append(sicboTbl)
    }
    
    func updateTablesData(view: GameBaseView){
        tableData = tablesData[view.tag]
        view.gameTypeLbl.text = tableData.name
        view.gameTypeIv.image = UIImage(named: "\(tableData.icon)")
        
        view.firstLbl.text = tableData.firstLbl
        view.firstResultLbl.text = tableData.firstResult
        
        view.secondLbl.text = tableData.secondLbl
        view.secondResultLbl.text = tableData.secondResult
        
        view.thirdLbl.text = tableData.thirdLbl
        view.thirdResultLbl.text = tableData.thirdResult
        
        view.forthLbl.text = tableData.forthLbl
        view.forthResultLbl.text = tableData.forthResult
    }
    
    func setupViews(){
        let baccGameView = GameBaseView()
        baccGameView.delegate = self
        baccGameView.tag = 0
        updateTablesData(view: baccGameView)
        
        let dragonGameView = GameBaseView()
        dragonGameView.delegate = self
        dragonGameView.tag = 1
        updateTablesData(view: dragonGameView)
        
        let sicboGameView = GameBaseView()
        sicboGameView.delegate = self
        sicboGameView.tag = 2
        updateTablesData(view: sicboGameView)
        
        let rouletteGameView = GameBaseView()
        rouletteGameView.delegate = self
        rouletteGameView.tag = 3
        updateTablesData(view: rouletteGameView)
        
        gameViews.append(baccGameView)
        gameViews.append(dragonGameView)
        gameViews.append(sicboGameView)
        gameViews.append(rouletteGameView)
        
        baseView.addSubview(gameViews[index])
        gameViews[index].snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }

    @IBAction func nextTapped(_ sender: Any) {
        if index < gameViews.count-1 {
            gameViews[index].removeFromSuperview()
            index += 1
        } else {
            gameViews[index].removeFromSuperview()
            index = 0
        }
        print(index)
        
        baseView.addSubview(gameViews[index])
        gameViews[index].snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    @IBAction func previousTapped(_ sender: Any) {
        if index > 0 {
            gameViews[index].removeFromSuperview()
            index -= 1
        } else {
            gameViews[index].removeFromSuperview()
            index = gameViews.count-1
        }
        print(index)
        
        baseView.addSubview(gameViews[index])
        gameViews[index].snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    func showGameController(){
        print("Open game play")
        let gameController = GameBaseController()
        present(gameController, animated: true, completion: nil)
    }
    
}
