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
        // shareTapped之所以前面要加上 @objc,是因為UIKit是由objective c 寫成的，而UIBarbuttonItem就是在UIKit下面，若不加上 @objc，objective c無法看見shareTapped，這樣才可以將此程式暴露(expose)給objective c
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
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
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return }
        // UIActivityViewController, which is the iOS method of sharing content with other apps and services.
        // applicationActivities - an array of any of your own app's services you want to make sure are in the list
        let vc = UIActivityViewController(activityItems: [], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
