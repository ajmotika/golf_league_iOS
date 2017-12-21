//
//  CurrentRoundViewController.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit

class CurrentRoundViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Properties
    @IBOutlet weak var scorecardTableView: UITableView!
    
    var tee: CourseTee?
    
    //MARK: UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scorecardTableView.dataSource = self
        preloadCourseTee()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numNines = tee?.nines.count else {
            return 0
        }
        return numNines * 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HoleTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HoleTableViewCell else {
            fatalError("The dequeued cell is not an instance of HoleTableViewCell.")
        }
        
        guard let hole = tee?[indexPath.row] else {
            fatalError("The hole at \(indexPath.row) doesn't exist")
        }
        
        cell.setProperties(using: hole)
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private methods
    private func preloadCourseTee() {
        let firstNine = NineHoles(
            hole1: Hole(number: 1, par: 4, yardage: 399, handicap: 4),
            hole2: Hole(number: 2, par: 3, yardage: 173, handicap: 16),
            hole3: Hole(number: 3, par: 4, yardage: 331, handicap: 18),
            hole4: Hole(number: 4, par: 4, yardage: 368, handicap: 8),
            hole5: Hole(number: 5, par: 5, yardage: 501, handicap: 12),
            hole6: Hole(number: 6, par: 4, yardage: 329, handicap: 6),
            hole7: Hole(number: 7, par: 3, yardage: 163, handicap: 14),
            hole8: Hole(number: 8, par: 5, yardage: 518, handicap: 10),
            hole9: Hole(number: 9, par: 4, yardage: 456, handicap: 2))
        tee = CourseTee(color: .blue, rating: 71.0, slope: 115, firstNine: firstNine)
        
    }

}
