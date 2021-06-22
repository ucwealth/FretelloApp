//
//  ViewController.swift
//  FretelloApp
//
//  Created by Decagon on 11/06/2021.
//
import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var sessionModel = ExerciseSession()
    var maxIncreaseLabel = UILabel()
    var sessionTableView = UITableView()
    var name = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        sessionTableView.dataSource = self
        sessionTableView.delegate = self
        setupMaxIncreaseLabel()
        getSession()
    }
    
    func setupMaxIncreaseLabel() {
        maxIncreaseLabel = UILabel()
        view.addSubview(maxIncreaseLabel)
        maxIncreaseLabel.backgroundColor =  #colorLiteral(red: 0.973849237, green: 0.7645936608, blue: 0.3679264188, alpha: 1)
        maxIncreaseLabel.textAlignment = .center
        maxIncreaseLabel.font = .systemFont(ofSize: 17, weight: .medium)
        maxIncreaseLabel.textColor = #colorLiteral(red: 0.1490196078, green: 0.1333333333, blue: 0.1294117647, alpha: 1)
        maxIncreaseLabel.layer.cornerRadius = 60

        maxIncreaseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(0.065)
        }

    }
    
    func setupTableView() {
        sessionTableView.register(SessionTableViewCell.self, forCellReuseIdentifier: "tableCell")
        sessionTableView.backgroundColor = .systemBackground
        view.addSubview(sessionTableView)
        sessionTableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(120)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessionModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessionModel[0].exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SessionTableViewCell.identifier, for: indexPath) as? SessionTableViewCell else { return UITableViewCell()}
        let selected = sessionModel[indexPath.section].exercises[indexPath.row]
        cell.setUp(with: selected)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView()
        sectionHeader.backgroundColor = #colorLiteral(red: 0.1575595737, green: 0.1251297295, blue: 0.1373164356, alpha: 1)
        let sessionLabel = UILabel()
        sessionLabel.text = (sessionModel[section].name)
        sessionLabel.textAlignment = .left
        sessionLabel.textColor =  #colorLiteral(red: 0.973849237, green: 0.7645936608, blue: 0.3679264188, alpha: 1)
        sessionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        sessionLabel.frame = CGRect(x: 18, y: 3 , width: self.view.frame.width, height: 40)
        sectionHeader.addSubview(sessionLabel)
        
        let dateLabel = UILabel()
        dateLabel.text = String((sessionModel[section].practicedOnDate).prefix(10))
        dateLabel.textColor =  #colorLiteral(red: 0.973849237, green: 0.7645936608, blue: 0.3679264188, alpha: 1)
        dateLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        dateLabel.textAlignment = .left
        dateLabel.frame = CGRect(x: sessionLabel.frame.width-120, y: 4, width: self.view.frame.width/2, height: 40)
        sectionHeader.addSubview(dateLabel)
        
        return sectionHeader
    }
    
    func getSession(){
        let request = AF.request("http://codingtest.fretello.com:3000/data/sessions.json")
        request.responseDecodable(of: ExerciseSession.self) { [self] (response) in
            guard var result = response.value else { return }
            result.reverse()
            sessionModel.append(contentsOf: result)
            
            var bpmArr = [[Int]]()
            for j in sessionModel {
                var bpmSubArr = [Int]()
                for k in j.exercises {
                    bpmSubArr.append(k.practicedAtBPM)
                }
                bpmArr.append(bpmSubArr)
            }
            let maxPerfomance = maximumIncrease().max(inputArr: bpmArr.reversed())
            self.maxIncreaseLabel.text = "Increase in Maximum Output: \(maxPerfomance)%"

            DispatchQueue.main.async {
                self.sessionTableView.reloadData()
            }
            
        }
    }
    
    
}
