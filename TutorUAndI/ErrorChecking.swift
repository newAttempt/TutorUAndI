//
//  ErrorChecking.swift
//  TutorUAndI
//
//  Created by zeyong shan on 3/8/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import Foundation


// This file is not for controller use!


class ErrorChecker
{
    
    // Private =======================================================
    
    private class func checkYear(_ year: String) -> String?
    {
        let yy_int = Int(year)
        if yy_int == nil
        {
            return "The year should be a two digit number !"
        }
        return nil
    }
    
    
    private class func checkMonth(_ month: String) -> String?
    {
        let mm_int = Int(month)
        if mm_int == nil
        {
            return "The month should be a two digit number !"
        }else if mm_int! < 1 || mm_int! > 12
        {
            return "The month should between 1 to 12"
        }
        return nil
    }
    
    
    private class func checkDayInMonth(_ day: String) -> String?
    {
        let dd_int = Int(day)
        if dd_int == nil
        {
            return "The day should be a two digit number ! "
        }else if dd_int! < 1 || dd_int! > 31
        {
            return "The day should be between 1 to 31"
        }
        return nil
    }
    
    
    private class func checkCardNo(_ no: String) -> String?
    {
        if no.characters.count != 16
        {
            return "card No. should be a 16 digit number"
        }
        if Int(no) == nil
        {
            return "card No. contains invalid letters!"
        }
        return nil
    }
    
    
    private class func checkExpritDate(_ date: String) -> String?
    {
        if date.characters.count != 4
        {
            return "expire date should be a 4 digit number : MMYY"
        }
        if Int(date) == nil
        {
            return "exprie date contains invalid letters!"
        }
        return nil
    }
    
    
    // ======================================================= Private
    
    
    // Public ========================================================
    class func checkIfDobValid(_ dob: String) -> String?
    {
        // a function to check if the date of brith in correct format!
        if dob.characters.count != 6
        {
            return "Wrong formet for Date of Brith !!!"
        }
        
        // initialize year, month and day
        var dob_copy = dob
        var yy = ""
        var mm = ""
        var dd = ""
        
        for _ in 0...1
        {
            yy.append(dob_copy.characters[dob_copy.characters.startIndex])
            dob_copy.remove(at: dob_copy.startIndex)
        }
        for _ in 0...1
        {
            mm.append(dob_copy.characters[dob_copy.characters.startIndex])
            dob_copy.remove(at: dob_copy.startIndex)
        }
        for _ in 0...1
        {
            dd.append(dob_copy.characters[dob_copy.characters.startIndex])
            dob_copy.remove(at: dob_copy.startIndex)
        }
        
        var error = checkYear(yy)
        if error != nil
        {
            return error
        }
        error = checkMonth(mm)
        if error != nil
        {
            return error
        }
        error = checkDayInMonth(dd)
        if error != nil
        {
            return error
        }
        
        return nil
    }
    
    
    class func checkIfGenderValid(_ gender: Int) -> String?
    {
        if gender > 2 || gender < 0
        {
            return "Debug Info: Wrong formet for gender !!!"
        } // ****** This is a debug information, not a error message to user!!!!!!
        return nil
    }
    
    
    class func checkIfZipValid(_ zip: String) -> String?
    {
        if zip.characters.count != 5
        {
            return "zip should be a 5 digit number"
        }
        
        let zipNum = Int(zip)
        if zipNum == nil
        {
            return "zip contains invalid letter."
        }
        
        return nil
    }
    
    
    class func checkIfZipValid(_ zip: Int) -> String?
    {
        if  "\(zip)".characters.count != 5
        {
            return "worng zip code formet !!!"
        }
        return nil
    }
    
    
    class func checkIfBankValid(_ cardNo: String, _ expirtDate: String) -> String?
    {
        var error = checkCardNo(cardNo)
        if error != nil
        {
            return error
        }
        error = checkExpritDate(expirtDate)
        if error != nil
        {
            return error
        }
        return nil
    }
    
    
    // ======================================================== Public
}
