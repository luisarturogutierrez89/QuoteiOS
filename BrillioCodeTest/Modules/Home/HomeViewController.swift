//
//  HomeViewController.swift
//  BrillioCodeTest
//
//  Created by Luis Gutierrez Juarez on 29/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var quoteTxtView: UITextView!
    @IBOutlet weak var refreshButton: UIButton!
    private var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()
    }
    
    func configViewModel() {
        viewModel = HomeViewModel()
        viewModel?.start()
        viewModel?.bindGetQuote = { quote in
            self.updateWith(quote: quote)
        }
        
    }
    
    func updateWith(quote: Quote) {
        DispatchQueue.main.async {
            self.authorLbl.text = quote.author
            self.quoteTxtView.text = quote.content
        }
    }
    
    @IBAction func didPreesRefreshButton() {
        viewModel?.getQuoteData()
    }


}
