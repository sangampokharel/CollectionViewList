//
//  ViewController.swift
//  CollectionViewList
//
//  Created by sangam pokharel on 02/04/2024.
//

import UIKit

enum CollectionViewTypes {
    case grid
    case collectionViewInsideTableView
    case collectionViewHeadersFooters
    case instragramLikeCollectionView
    case customCellCollectionView
    case collectionViewHeaderFooterProgramatically
    case collectionViewProgrammatically
    case waterFallLayoutCollectionView
}
struct CollectionViewTypeModel {
    let title:String
    let type:CollectionViewTypes
}
class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
//    private var model = ["Grid Based Collection view","CollectionView Inside TableView","Collection View Headers and Footers","Instagram Like CollectionView","Custom Cell CollectionView","CollectionView Headers and Footers Programatically","CollectionView Programmatically","Waterfall layout collectionView"]
    
    private var model:[CollectionViewTypeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.append(CollectionViewTypeModel(title: "Grid Based Collection view", type: .grid))
        model.append(CollectionViewTypeModel(title: "CollectionView Inside TableView", type: .collectionViewInsideTableView))
        model.append(CollectionViewTypeModel(title: "Collection View Headers and Footers", type: .collectionViewHeadersFooters))
        model.append(CollectionViewTypeModel(title: "Instagram Like CollectionView", type: .instragramLikeCollectionView))
        model.append(CollectionViewTypeModel(title: "Custom Cell CollectionView", type: .customCellCollectionView))
        model.append(CollectionViewTypeModel(title: "CollectionView Headers and Footers Programatically", type: .collectionViewHeaderFooterProgramatically))
        model.append(CollectionViewTypeModel(title: "CollectionView Programmatically", type: .collectionViewProgrammatically))
        model.append(CollectionViewTypeModel(title: "Waterfall layout collectionView", type: .waterFallLayoutCollectionView))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //MARK: Navigate to collectionview view controller
        
        let collectionViewTypes = model[indexPath.row].type
        
        switch collectionViewTypes {
        case .grid:
            let vc = storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as! GirdBasedCollectionViewController
            vc.images = Array(1...50).compactMap { _ in "person1" }
            navigationController?.pushViewController(vc, animated: true)
            break
        case .collectionViewInsideTableView:
            let storyboard = UIStoryboard(name: "SecondMain", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CollectionViewInsideTVController") as! CollectionViewInsideTVController
            navigationController?.pushViewController(vc, animated: true)
            break
            
        case .collectionViewHeadersFooters:
            let storyboard = UIStoryboard(name: "CVHeaderFooter", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CollectionViewHeaderFooterViewController")  as! CollectionViewHeaderFooterViewController
            navigationController?.pushViewController(vc, animated: true)
            break
            
        case .instragramLikeCollectionView:
            let storyboard = UIStoryboard(name: "InstragramStory", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "InstagramStoryViewController") as! InstagramStoryViewController
            navigationController?.pushViewController(vc, animated: true)
            break
            
        case .customCellCollectionView:
            let vc = CollectionViewGridProgrammaticallyViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
            
        case .waterFallLayoutCollectionView:
            let storyboard = UIStoryboard(name: "WaterFall", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WaterFallCollectionViewController") as! WaterFallCollectionViewController
            navigationController?.pushViewController(vc, animated: true)
            break
            
        case .collectionViewHeaderFooterProgramatically:
            let vc = ProgramaticallyCollectionViewHeaderFooterViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
            
        default:
            break
        }
        
      
        
    }
}

