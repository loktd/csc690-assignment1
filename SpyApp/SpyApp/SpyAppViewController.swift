import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    let factory = CipherFactory()
    var cipher: Cipher?

    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }

    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            if(secret.text == "")
            {
                output.text = "No secret inputted"
            }else{
                output.text = "Error encoding"
            }
        }
    }

    @IBAction func decryptButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let decrypted = cipher.decrypt(plaintext, secret: secretText) {
            output.text = decrypted
        } else {
            if(secret.text == "")
            {
                output.text = "No secret inputted"
            }else{
                output.text = "Error encoding"
            }
        }
    }
    
    
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    //alphanumeric Ceasar button action
    @IBAction func alphanumericCeasarButtonPressed(_ sender: UIButton) {
        guard
            //set buttonText
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        //call CipherFactor with buttonText
        cipher = factory.cipher(for: buttonText)
    }
    
    @IBAction func triangularCipherButtonPressed(_ sender: UIButton) {
        guard
            //set buttonText
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        //call CipherFactor with buttonText
        cipher = factory.cipher(for: buttonText)
    }
    @IBAction func squaredButtonPressed(_ sender: UIButton) {
        guard
            //set buttonText
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        //call CipherFactor with buttonText
        cipher = factory.cipher(for: buttonText)
    }
}

