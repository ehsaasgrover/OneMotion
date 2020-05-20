//
//  ViewController.swift
//  Workout
//
//  Created by Grace Subianto on 19/05/20.
//  Copyright © 2020 Grace Subianto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
       
    @IBOutlet weak var repNumber: UITextField!
    
    @IBOutlet weak var setNumber: UITextField!
    @IBOutlet weak var date: UITextField!
    
    @IBOutlet weak var timetaken: UITextField!
    @IBOutlet weak var workout: UITextField!
    
    let workouts = ["Sit-Up", "Push-Up", "Squats", "Pull-Ups"]
    let pickerView = UIPickerView()
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatePicker()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        workout.inputView = pickerView
        workout.textAlignment = .center
        
        repNumber.delegate = self
        setNumber.delegate = self
        timetaken.delegate = self
               
        
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return workouts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return workouts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        workout.text = workouts[row]
        workout.resignFirstResponder()
    }


    func createDatePicker(){
        
        // allignment
        date.textAlignment = .center

        
        //toolbear
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar to keyboard
        date.inputAccessoryView = toolbar
        
        
        //asign datepicker to textfield
        date.inputView = datePicker
        
        
        //date picker mode
        datePicker.datePickerMode = .date
    }
  
    
    @objc func donePressed(){
        
        //formatting
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        date.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        repNumber.resignFirstResponder()
        setNumber.resignFirstResponder()
        timetaken.resignFirstResponder()
    }
    
    
    @IBAction func saveWorkout(_ sender: Any) {
        //this button would save the workout details into the database
    }
    
}



