//
//  SquaredCipherTests.swift
//  SpyAppTests
//
//  Created by Kurtis Hoang on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class SquaredCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = SquaredCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_basicTextAndSecretText(){
        let plaintext = "test01"
        let result = cipher.encode(plaintext, secret: "1")
        let result1 = cipher.decrypt("uftu12", secret: "1")
        XCTAssertEqual("uftu12", result)
        XCTAssertEqual("test01", result1)
    }
    
    func test_lessThan33()
    {
        let plaintext = "test space"
        let result = cipher.encode(plaintext, secret: "2")
        let result1 = cipher.decrypt("xiwx%wtegi", secret: "2")
        XCTAssertEqual("xiwx%wtegi", result)
        XCTAssertEqual("test!space", result1)
    }
    
    func test_stringInbetween65And90(){
        let plaintext = "ABCXYZ"
        let result = cipher.encode(plaintext, secret: "1")
        let result1 = cipher.decrypt("bcdyz{", secret: "1")
        XCTAssertEqual("bcdyz{", result)
        XCTAssertEqual("abcxyz", result1)
    }
    
    func test_stringGreaterThanDecimal126(){
        let plaintext = "¢©"
        let result = cipher.encode(plaintext, secret: "1")
        let result1 = cipher.decrypt(plaintext, secret: "1")
        XCTAssertEqual("EL", result)
        XCTAssertEqual("CJ", result1)
    }
}
