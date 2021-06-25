//
//  ExampleViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 15/06/2021.
//

import UIKit

class ExampleViewController: BaseViewController {
    
    let viewModel = ViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.registerReusableCell(FlashSaleTableViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background2
        layoutTableView()
    }
    
    private func layoutTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            if #available(iOS 11, *) {
                $0.top.equalTo(view.safeAreaLayoutGuide)
                    
            } else {
                $0.top.equalTo(topLayoutGuide.snp.bottom)
            }
            
            $0.leading.trailing.equalToSuperview()
                .inset(16)
            $0.bottom.equalToSuperview()
            
        }
    }
}

extension ExampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ExampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FlashSaleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.configCell(viewModel: viewModel)
        return cell
    }
}
