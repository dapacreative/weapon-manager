//
//  Destiny2API.swift
//  WeaponManager
//
//  Created by HOEING, MATT J [AG-Contractor/1000] on 12/18/17.
//  Copyright © 2017 adhoc. All rights reserved.
//

import Foundation


//let pyrus = "PyrusBanana"
//let fox = "ProdigalFox"
//let pyrusDestinyMembershipId = "4611686018432469565" // pyrus
//let foxDestinyMembershipId = "4611686018429726042" // fox
//
//print("Hello world")
//
//APICaller().getMembershipInfo(fox)
//APICaller().getProfileInfo(pyrusDestinyMembershipId)
//APICaller().getManifest()
//APICaller().getItemInfo(pyrusDestinyMembershipId, "6917529040947778515")

public class APICaller {
    let urlBase = "https://www.bungie.net/Platform"
    let membershipType = "1"
    
    public init() {}
    
    public func getMembershipInfo(_ displayName: String) {
        let path = "/Destiny2/SearchDestinyPlayer/\(membershipType)/\(displayName)/"
        makeCall(url: urlBase, path: path, query: "")
    }
    
    public func getProfileInfo(_ destinyMembershipId: String) {
        let path = "/Destiny2/\(membershipType)/Profile/\(destinyMembershipId)/"
        let query = "?components=205"
        
        // 100 = profiles
        // 200 = characters
        // 205 = character equipment - equipped
        makeCall(url: urlBase, path: path, query: query)
    }
    
    public func getItemInfo(_ destinyMembershipId: String, _ itemInstanceId: String) {
        let path = "/Destiny2/\(membershipType)/Profile/\(destinyMembershipId)/Item/\(itemInstanceId)/"
        let query = "?components=300"
        makeCall(url: urlBase, path: path, query: query)
    }
    
    public func getManifest() {
        let path = "/Destiny2/Manifest/"
        makeCall(url: urlBase, path: path, query: "")
    }
    
    func makeCall(url: String, path: String, query: String) {
        guard let url = URL(string: urlBase+path+query) else { return }
        
        print("Sending request to URL: \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("0cafbb6bc51f404b9bfc9ff14cc08b25", forHTTPHeaderField: "X-API-Key")
        
        print("\tstarting loop...")
        let runLoop = CFRunLoopGetCurrent()
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            print("\tgot response...")
            if error != nil {
                print(error!.localizedDescription)
            }
            
            print(data ?? "default")
            
            guard let data = data else { return }
            do {
                if let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print(result)
                } else {
                    print("Failed... for some reason...")
                }
            } catch {
                print("Failed to parse.")
            }
            CFRunLoopStop(runLoop)
        })
        
        print("\tcalling resume...")
        task.resume()
        CFRunLoopRun()
    }
}
