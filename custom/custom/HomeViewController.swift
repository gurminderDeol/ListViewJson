//
//  HomeViewController.swift
//  custom
//
//  Created by Kiran Mehal on 2019-03-14.
//  Copyright © 2019 Kiran Mehal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
@IBOutlet weak var tbl: UITableView!
    var studentArray: [Student]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbl.delegate = self
        self.tbl.dataSource = self
        
        loadStudentData()
        // Do any additional setup after loading the view.
    }
    private func loadStudentData()
    {
        studentArray = []
        studentArray.append(Student(Fname: "Pritesh", Lname: "Patel", gender: "Male", result: "Fail"))
        studentArray.append(Student(Fname: "Priyanka", Lname: "gupta", gender: "Female", result: "Pass"))
        studentArray.append(Student(Fname: "Mohammed Ayub", Lname: "Ali", gender: "Male", result: "Fail"))
        studentArray.append(Student(Fname: "Arturo", Lname: "Gonzalez", gender: "Male", result: "Pass"))
        studentArray.append(Student(Fname: "Gurvinder", Lname: "Singh", gender: "Male", result: "Pass"))
        studentArray.append(Student(Fname: "Pritesh", Lname: "Patel", gender: "Male", result: "Pass"))
        studentArray.append(Student(Fname: "Pritesh", Lname: "Patel", gender: "Male", result: "Fail"))
        studentArray.append(Student(Fname: "Pritesh", Lname: "Patel", gender: "Male", result: "Pass"))
        studentArray.append(Student(Fname: "Pritesh", Lname: "Patel", gender: "Male", result: "Fail"))
        studentArray.append(Student(Fname: "Pritesh", Lname: "Patel", gender: "Male", result: "Pass"))
        studentArray.append(Student(Fname: "Pritesh", Lname: "Patel", gender: "Male", result: "Pass"))
        studentArray.append(Student(Fname: "Pritesh", Lname: "Patel", gender: "Male", result: "Fail"))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentCell = tableView.dequeueReusableCell(withIdentifier: "studentcell") as! StudentDetailsViewCell
        
        let student = self.studentArray[indexPath.row]
        
        studentCell.lblfname.text = student.Fname
        studentCell.lbllname.text = student.Lname
        studentCell.lblgender.text = student.gender
        studentCell.lblresult.text = student.result
        studentCell.lblresult.textColor = UIColor.green
        if(student.result == "Fail")
        {
            studentCell.lblresult.textColor = UIColor.red
        }
        
        return studentCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
        
        
    
    

}
