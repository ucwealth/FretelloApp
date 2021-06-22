//
//  SessionTableViewCell.swift
//  FretelloApp
//
//  Created by Decagon on 11/06/2021.
//

import UIKit
import SnapKit
import SDWebImage

class SessionTableViewCell: UITableViewCell {
    static let identifier = "tableCell"
    var tableCellView = UIView()
    var exerciseName = UILabel()
    var bpm = UILabel()
    var sessionImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableCellView()
        setupExerciseName()
        setupImageView()
        setupBpm()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUp(with model: Exercise){
        self.exerciseName.text = " Exercise name: \(model.name)"
        self.bpm.text = " Practice BPM: \(model.practicedAtBPM)"
        DispatchQueue.main.async {
            let imageUrl = URL(string: "http://codingtest.fretello.com:3000/img/\(model.exerciseID).png")
            self.sessionImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "place-img"))
        }
    }
    
    func setupTableCellView() {
        tableCellView = UIView()
        tableCellView.backgroundColor = #colorLiteral(red: 0.2018606663, green: 0.1099629775, blue: 0.06200115383, alpha: 1)
        tableCellView.layer.cornerRadius = 10
        contentView.addSubview(tableCellView)
        tableCellView.snp.makeConstraints { (make) in
            make.topMargin.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom)
            make.height.equalTo(120)
            make.width.equalTo(contentView).multipliedBy(0.93)
        }
    }
   
    func setupExerciseName() {
        exerciseName = UILabel()
        exerciseName.font = UIFont(name: "Georgia", size: 16)
        exerciseName.textColor = .white
        exerciseName.numberOfLines = 0
        exerciseName.lineBreakMode = .byCharWrapping
        tableCellView.addSubview(exerciseName)
        exerciseName.snp.makeConstraints { (make) in
            make.leading.equalTo(tableCellView.snp.leading).offset(95)
            make.top.equalTo(tableCellView.snp.top).offset(30)
        }
    }
    
    func setupBpm() {
        bpm = UILabel()
        bpm.font = UIFont(name: "Georgia", size: 14)
        bpm.numberOfLines = 0
        bpm.lineBreakMode = .byCharWrapping
        bpm.textColor = .white
        tableCellView.addSubview(bpm)
        bpm.snp.makeConstraints { (make) in
            make.leading.equalTo(exerciseName.snp.leading)
            make.top.equalTo(exerciseName.snp.bottom).offset(10)
        }
    }
    
    func setupImageView() {
        sessionImage = UIImageView()
        tableCellView.addSubview(sessionImage)
        sessionImage.backgroundColor = .black
        sessionImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(tableCellView)
            make.left.equalTo(tableCellView.snp.left).offset(10)
            make.width.equalTo(tableCellView.snp.width).multipliedBy(0.2)
            make.height.equalTo(tableCellView.snp.height).multipliedBy(0.6)
        }
    }

}
