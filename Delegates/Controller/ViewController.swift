//
//  ViewController.swift
//  Delegates
//
//  Created by Serkan Mehmet Malagiç on 24.10.2021.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var strArr = ["ViewController item", "ViewController item", "ViewController item"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    @IBAction func pushVC(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewControllerSB") as? SecondViewController
        vc?.secondViewControllerDelegate = self
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func loadPost() {
        NetworkClient.performRequest(vc: self, object: Post.self, router: APIRouter.getPost(id: "1"), success: { result in
            print("loadPost çalıştı")
            // self.loadPosts()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func loadPosts(){
        strArr.removeAll()
        NetworkClient.performRequest(vc: self, object:[Post].self, router: APIRouter.getPosts) { result in
            print("loadPosts çalıştı")
            for item in result {
                self.strArr.append(item.body)
            }
            self.tableView.reloadData()
        } failure: { error in
            print(error.localizedDescription)
        }
    }
    
    func loadPostComments(){
        NetworkClient.performRequest(vc: self, object:[Comment].self, router: APIRouter.getPostsComments(id: "1")) { result in
            print("loadPostComments çalıştı")
            self.loadUsers()
        } failure: { error in
            print(error.localizedDescription)
        }
    }
    
    func loadUsers(){
        NetworkClient.performRequest(vc: self, object:[User].self, router: APIRouter.getUsers) { result in
            print("loadUsers çalıştı")
        } failure: { error in
            print(error.localizedDescription)
        }
        
    }
    
    func getRequest() {
        loadPosts()
    }
    
}

extension ViewController:
                          UITableViewDelegate,
                          UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = strArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strArr.count
    }
}
