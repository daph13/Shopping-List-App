//
//  ThirdViewController.swift
//  ShoppingListApp
//
//  Created by Daphne Cheryl TAN (001034796) on 17/5/18.
//  Copyright © 2018 Daphne Cheryl TAN (001034796). All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var fontPickerView: UIPickerView!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var colourScrollView: UIScrollView!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blue1Button: UIButton!
    @IBOutlet weak var blue2Button: UIButton!
    @IBOutlet weak var blue3Button: UIButton!
    @IBOutlet weak var blue4Button: UIButton!
    @IBOutlet weak var blue5Button: UIButton!
    @IBOutlet weak var red1Button: UIButton!
    @IBOutlet weak var red2Button: UIButton!
    @IBOutlet weak var red3Button: UIButton!
    @IBOutlet weak var red4Button: UIButton!
    @IBOutlet weak var red5Button: UIButton!
    @IBOutlet weak var yellow1Button: UIButton!
    @IBOutlet weak var yellow2Button: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var green1Button: UIButton!
    @IBOutlet weak var green2Button: UIButton!
    
    
    
    
    var fonts:[String] = []
    
    //Blue Buttons
    @IBAction func blueButtonClicked(_ sender: UIButton) {
        Colour.sharedInstance.selectedColour = UIColor.blue
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    @IBAction func blue1ButtonClicked(_ sender: UIButton) {
        Colour.sharedInstance.selectedColour  = UIColor( red: 51/255.0, green: 102/255.0, blue: 255/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
        
    }
    
    @IBAction func blue2Button(_ sender: UIButton) {
           Colour.sharedInstance.selectedColour = UIColor( red: 0/255.0, green: 128/255.0, blue: 255/255.0, alpha:1.0)
           view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    @IBAction func blue3Button(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 102/255.0, green: 153/255.0, blue: 255/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 102/255.0, green: 153/255.0, blue: 255/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
        
    }
    @IBAction func blue4ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 153/255.0, green: 204/255.0, blue: 255/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 153/255.0, green: 204/255.0, blue: 255/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    @IBAction func blue5ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 102/255.0, green: 255/255.0, blue: 255/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 102/255.0, green: 255/255.0, blue: 255/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    //Red Buttons
    
    @IBAction func redButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor.red
        Colour.sharedInstance.selectedColour = UIColor.red
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func red1ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 255/255.0, green: 80/255.0, blue: 80/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 255/255.0, green: 80/255.0, blue: 80/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func red2ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func red3ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func red4ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func red5ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 255/255.0, green: 204/255.0, blue: 153/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 255/255.0, green: 204/255.0, blue: 153/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    //Yellow Buttons
    
    @IBAction func yellowButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor.yellow
        Colour.sharedInstance.selectedColour = UIColor.yellow
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func yellow1ButtonClicked(_ sender: Any) {
        //view.backgroundColor = UIColor( red: 255/255.0, green: 255/255.0, blue: 102/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 255/255.0, green: 255/255.0, blue: 102/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func yellow2ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 255/255.0, green: 255/255.0, blue: 153/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 255/255.0, green: 255/255.0, blue: 153/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    //Other Buttons
    
    @IBAction func greenButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 204/255.0, green: 255/255.0, blue: 102/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 204/255.0, green: 255/255.0, blue: 102/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func green1ButtonClicked(_ sender: UIButton) {
        //view.backgroundColor = UIColor( red: 102/255.0, green: 255/255.0, blue: 51/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 102/255.0, green: 255/255.0, blue: 51/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    @IBAction func green2ButtonClicked(_ sender: Any) {
        //view.backgroundColor = UIColor( red: 0/255.0, green: 153/255.0, blue: 51/255.0, alpha:1.0)
        Colour.sharedInstance.selectedColour = UIColor( red: 0/255.0, green: 153/255.0, blue: 51/255.0, alpha:1.0)
        view.backgroundColor = Colour.sharedInstance.selectedColour
    }
    
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        //change font size with slider
        textTextField.font = UIFont(name: textTextField.font!.fontName, size: CGFloat(sender.value))
        //appDelegate.fontSize = CGFloat(sender.value)
    }
    
    func loadFonts(){
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            let names = UIFont.fontNames (forFamilyName:familyName)
            for name in names {
                fonts.append(name)
            }
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fonts.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return fonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print("current row \(row) && current point size\(String(describing: textTextField?.font!.pointSize))")
           textTextField.font = UIFont(name:fonts[row], size:(textTextField?.font!.pointSize)!)
           appDelegate.font = UIFont(name:fonts[row], size:(textTextField?.font!.pointSize)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFonts()
        blue1Button.backgroundColor = UIColor( red: 51/255.0, green: 102/255.0, blue: 255/255.0, alpha:1.0)
        blue2Button.backgroundColor = UIColor(red: 0/255.0, green: 128/255.0, blue: 255/255.0, alpha:1.0)
        blue3Button.backgroundColor = UIColor( red: 102/255.0, green: 153/255.0, blue: 255/255.0, alpha:1.0)
        blue4Button.backgroundColor = UIColor( red: 153/255.0, green: 204/255.0, blue: 255/255.0, alpha:1.0)
        blue5Button.backgroundColor=UIColor( red: 102/255.0, green: 255/255.0, blue: 255/255.0, alpha:1.0)
        red1Button.backgroundColor = UIColor( red: 255/255.0, green: 80/255.0, blue: 80/255.0, alpha:1.0)
        red2Button.backgroundColor = UIColor( red: 255/255.0, green: 102/255.0, blue: 0/255.0, alpha:1.0)
        red3Button.backgroundColor = UIColor( red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha:1.0)
        red4Button.backgroundColor = UIColor( red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha:1.0)
        red5Button.backgroundColor = UIColor( red: 255/255.0, green: 204/255.0, blue: 153/255.0, alpha:1.0)
        yellow1Button.backgroundColor = UIColor( red: 255/255.0, green: 255/255.0, blue: 102/255.0, alpha:1.0)
        yellow2Button.backgroundColor = UIColor( red: 255/255.0, green: 255/255.0, blue: 153/255.0, alpha:1.0)
        greenButton.backgroundColor = UIColor( red: 204/255.0, green: 255/255.0, blue: 102/255.0, alpha:1.0)
        green1Button.backgroundColor = UIColor( red: 102/255.0, green: 255/255.0, blue: 51/255.0, alpha:1.0)
        green2Button.backgroundColor = UIColor( red: 0/255.0, green: 153/255.0, blue: 51/255.0, alpha:1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
