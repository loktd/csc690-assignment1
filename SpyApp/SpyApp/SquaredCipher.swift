//
//  SquaredCipher.swift
//  SpyApp
//
//  Created by Kurtis Hoang on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

//SquaredCipher
struct SquaredCipher: Cipher{
    func encode(_ plaintext: String, secret: String) -> String? {
        guard var shiftBy = UInt32(secret) else {
            return nil
        }
        
        //squared
        shiftBy = shiftBy * shiftBy
        
        var encoded = ""
        
        //set text to lowercase
        let lowercaseText = plaintext.lowercased()
        
        for character in lowercaseText {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            
            //skip " " = 32 // start at ! = 33
            while(shiftedUnicode < 33)
            {
                shiftedUnicode = shiftedUnicode + 1
            }
            
            //skip A-Z //A = 65, Z = 90
            while ( shiftedUnicode > 64 && shiftedUnicode < 91)
            {
                shiftedUnicode = shiftedUnicode + 26
            }
            
            //max range //~ = 126
            while (shiftedUnicode > 126)
            {
                shiftedUnicode = shiftedUnicode - 94
            }
 
            shiftedUnicode = shiftedUnicode + shiftBy
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter;
        }
        
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard var shiftBy = UInt32(secret) else {
            return nil
        }
        
        //squared
        shiftBy = shiftBy * shiftBy
        
        var decrypted = ""
        
        //set text to lowercase
        let lowercaseText = plaintext.lowercased()
        
        for character in lowercaseText {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            
            //min range not including " " = 32
            //! = 33
            while (shiftedUnicode < 33)
            {
                shiftedUnicode = shiftedUnicode + 94
            }
            
            //skip A-Z //A = 65, Z = 90
            while ( shiftedUnicode > 64 && shiftedUnicode < 91)
            {
                shiftedUnicode = shiftedUnicode - 26
            }
            
            //max range //~ = 126
            while (shiftedUnicode > 126)
            {
                shiftedUnicode = shiftedUnicode - 94
            }
            
            shiftedUnicode = shiftedUnicode - shiftBy
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter;
        }
        
        return decrypted
    }
}
