//
//  DetailViewController.swift
//  ExampleMVVM
//
//  Created by hooni on 4/1/22.
//

import UIKit

class DetailViewController: BaseViewController {

    var viewModel: DetailViewModel?
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.title = "Groups"
        setupUI()
    }

    private func setupUI() {
        var yOffset = 10
        
        let flagImageView = UIImageView(frame: CGRect(x: 0, y: yOffset, width: 120, height: 90))
        flagImageView.layer.borderColor = UIColor.black.cgColor
        flagImageView.layer.borderWidth = 1.0
        flagImageView.loadFrom(urlSting: viewModel?.getTeamFlagUrl() ?? "", placeHolder: UIImage(named: "blank"))
        contentView.addSubview(flagImageView)
        
        yOffset += 5
        let nameLabel = UILabel()
        nameLabel.text = "Name: " + (viewModel?.getTeamName() ?? "")
        nameLabel.frame = CGRect(x: 140, y: yOffset, width: 100, height: 30)
        nameLabel.sizeToFit()
        contentView.addSubview(nameLabel)
        
        yOffset += 30
        let codeLabel = UILabel()
        codeLabel.text = "Code: " + (viewModel?.getTeamFifaCode() ?? "")
        codeLabel.frame = CGRect(x: 140, y: yOffset, width: 100, height: 30)
        codeLabel.sizeToFit()
        contentView.addSubview(codeLabel)
        
        yOffset += 30
        let iso2Label = UILabel()
        iso2Label.text = "ISO2: " + (viewModel?.getTeamIso2() ?? "")
        iso2Label.frame = CGRect(x: 140, y: yOffset, width: 100, height: 30)
        iso2Label.sizeToFit()
        contentView.addSubview(iso2Label)
        
        yOffset += 50
        let emojiLabel = UILabel()
        emojiLabel.text = "Emoj: " + (viewModel?.getTeamEmoji() ?? "") + " " + (viewModel?.getTeamEmojiString() ?? "")
        emojiLabel.frame = CGRect(x: 0, y: yOffset, width: 100, height: 30)
        emojiLabel.sizeToFit()
        contentView.addSubview(emojiLabel)
    }
}

