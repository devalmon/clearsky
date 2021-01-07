//
//  PoorViewController.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 01.01.2021.
//

import UIKit

class PoorViewController: UIViewController {
    
    let session = URLSession.shared
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    let decoder = JSONDecoder()
    let customTableView = UITableView()
    var albums = [Albums]()
    var posts = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
//        getAlbums()
        getPosts()
        setupTableView()
        
    }
    
    
    //MARK: - private functions
    private func setupTableView() {
        layoutCustomTableView()
        customTableView.dataSource = self
        customTableView.delegate = self
        customTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    private func layoutCustomTableView() {
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customTableView)
        NSLayoutConstraint.activate([
            customTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            customTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            customTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        customTableView.tableFooterView = UIView()
    }
    
    private func setupVC() {
        //        view.backgroundColor = UIColor(hex: "#74c7b8")
        view.backgroundColor = UIColor.white
    }
    
    private func getPosts() {
        guard let url = url else { return }
        
        let dt = session.dataTask(with: url) {[weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            
            if error == nil, let parsedData = data {
                guard let posts = try? strongSelf.decoder.decode([Posts].self, from: parsedData) else { return }
                strongSelf.posts = posts
                
                DispatchQueue.main.async {
                    strongSelf.customTableView.reloadData()
                }
        
            } else {
                print("url error")
            }
        }
        dt.resume()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

//MARK: - TableViewDataSource
extension PoorViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        
        
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.detailTextLabel?.text = post.body
        cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

