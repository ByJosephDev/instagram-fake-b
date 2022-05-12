//
//  ProfileViewController.swift
//  ProjectMVVM
//
//  Created by MAC32 on 11/05/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let userViewModel: UserViewModel = UserViewModel()
    
    var user: User? = nil
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var lblNombre: UILabel!
    
    @IBOutlet weak var lblGenero: UILabel!
    
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblCecular: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpData()
        }        // Do any additional setup after loading the view.
    }
    
    func setUpData() async {
        await userViewModel.getDataFromAPI()
        user = userViewModel.user
        setUpDataProfile()
    }
    
    func setUpDataProfile(){
    
        lblNombre.text = "\((user?.title.capitalized)!) \((user?.firstName)!) \((user?.lastName)!)"
        if(user?.gender == "female"){
            lblGenero.text = "Femenino"
        }else{
            lblGenero.text = "Masculino"
        }
        imageView.image = HelperImage.setImageFromUrl(url: (user?.picture)!)
        lblEmail.text = user?.email
        lblCecular.text = user?.phone
    }
    
    
    

}
