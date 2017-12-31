//
//  CurrentRoundViewController.swift
//  Golf League
//
//  Created by Andrew Motika on 12/21/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit

class CurrentRoundViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HoleTableViewCellDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var scorecardTableView: UITableView!
    @IBOutlet weak var numStrokesLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var noRoundLabel: UILabel!
    @IBOutlet weak var finishScorecardButton: UIBarButtonItem!
    @IBOutlet weak var scoresStackView: UIStackView!
    
    
    //MARK: Properties
    var round: Round? {
        didSet {
            setRoundView()
        }
    }
    
    //MARK: UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        scorecardTableView.dataSource = self
        //preloadRound()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if round == nil {
            setRoundView()
            self.performSegue(withIdentifier: "ScorecardToStartRoundSegue", sender: self)
        }
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
        guard let numHoles = round?.holes.count else {
            return 0
        }
        
        return numHoles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HoleTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HoleTableViewCell else {
            fatalError("The dequeued cell is not an instance of HoleTableViewCell.")
        }
        
        guard let roundHole = round?.holes[indexPath.row] else {
            fatalError("The hole at \(indexPath.row) doesn't exist")
        }
        
        cell.setProperties(using: roundHole, delegate: self)
        
        return cell
    }
    
    //MARK: HoleTableViewCellDelegate
    func setNextHole() {
        round?.incrementHole()
        updateScores()
    }

    //MARK: Actions
    @IBAction func unwindToCurrentRound(sender: UIStoryboardSegue) {
        if let startRoundViewController = sender.source as? StartRoundViewController {
            round = startRoundViewController.round
            self.scorecardTableView.reloadData()
        }
    }
    
    @IBAction func unwindToCurrentRoundFromCancel(sender: UIStoryboardSegue) {
        
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
    private func updateScores() {
        if let round = round {
            numStrokesLabel.text = String(round.strokes)
            scoreLabel.text = round.score
        }
    }
    
    private func setRoundView() {
        func setNoRoundView() {
            scorecardTableView.isHidden = true
            scoresStackView.isHidden = true
            noRoundLabel.isHidden = false
            finishScorecardButton.title = "Search"
        }
        
        func setValidRoundView() {
            scorecardTableView.isHidden = false
            scoresStackView.isHidden = false
            noRoundLabel.isHidden = true
            finishScorecardButton.title = "Finish"
        }
        
        if let _ = round {
            setValidRoundView()
        } else {
            setNoRoundView()
        }
    }
    
}
