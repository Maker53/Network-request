//
//  MainCollectionViewController.swift
//  Network request
//
//  Created by Станислав on 26.11.2021.
//

import UIKit

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case exampleOne = "Example one"
    case exampleTwo = "Example two"
    case exampleThree = "Example three"
    case exampleFour = "Example four"
    case ourCourses = "Our courses"
}

class MainCollectionViewController: UICollectionViewController {
    
    let userActions = UserActions.allCases
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage: performSegue(withIdentifier: "showImage", sender: nil)
        case .exampleOne: exampleOneButtonPressed()
        case .exampleTwo: exampleTwoButtonPressed()
        case .exampleThree: exampleThreeButtonPressed()
        case .exampleFour: exampleFourButtonPressed()
        case .ourCourses: performSegue(withIdentifier: "showCourses", sender: nil)
        }
    }
    
    // MARK: Private Methods
    private func succesAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug area",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see the results in the Debug area",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

// MARK: Networking
extension MainCollectionViewController {
    func exampleOneButtonPressed() {
        
    }
    
    func exampleTwoButtonPressed() {
        
    }
    
    func exampleThreeButtonPressed() {
        
    }
    
    func exampleFourButtonPressed() {
        
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
