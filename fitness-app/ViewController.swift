//
//  ViewController.swift
//  fitness-app
//
//  Created by Asista Mac Mini on 12/06/21.
//

import UIKit

struct Session {
    let id: Int
    let name: String
    var isSelected: Bool
}

class ViewController: UIViewController {

    
    @IBOutlet weak var timingCollectionView: UICollectionView!
    @IBOutlet weak var tableViewView: UITableView!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var prevDayButtonTapped: UIButton!
    @IBOutlet weak var nextDayButtonTapped: UIButton!
    private var sessions = [Session]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let session1 = Session(id: 1, name: "Morning", isSelected: true)
        let session2 = Session(id: 2, name: "Afternoon", isSelected: false)
        let session3 = Session(id: 3, name: "Evening", isSelected: false)
        let session4 = Session(id: 4, name: "Night", isSelected: false)
        
        sessions = [session1, session2, session3, session4]
        timingCollectionView.reloadData()
        fetchTasks()
    }

    private func setupUI() {
        timingCollectionView.register(UINib(nibName: TimingCell.identifier, bundle: nil), forCellWithReuseIdentifier: TimingCell.identifier)
        timingCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                
    }
    
    private func fetchTasks() {
        let filePath = Bundle.main.path(forResource: "task_data", ofType:  "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
        let taskModel = try! JSONDecoder().decode(TaskModel.self, from: data)
  
        print(taskModel)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimingCell.identifier, for: indexPath) as! TimingCell
        let session = sessions[indexPath.row]
        
        cell.timingLabel.text = session.name
        if session.isSelected == true {
            cell.timingLabel.font = .systemFont(ofSize: 17, weight: .semibold)
            cell.selectionIndicator.isHidden = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for index in 0..<sessions.count - 1 {
            sessions[index].isSelected = false
        }
        sessions[indexPath.row].isSelected = true
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Device.screenWidth / 4, height: 60)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(TaskCell.identifier, owner: self, options: nil)?.first as! TaskCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
