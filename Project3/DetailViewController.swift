//
//  DetailViewController.swift
//  Project1
//
//  Created by Alisha on 2022/9/11.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var x: Int?
    var y: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(x!) of \(y!)"
        // 因為ViewController 已經設定prefersLargeTitles = true，所以後續的每個ViewController都會預設大標題，寫入這行可以更改這項設定
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // 按一下收起navigation bar
        self.navigationController?.hidesBarsOnTap = true

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.hidesBarsOnTap = false
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
