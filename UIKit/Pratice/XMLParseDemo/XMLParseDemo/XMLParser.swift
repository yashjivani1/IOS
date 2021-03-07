//
//  XMLParser.swift
//  XMLParseDemo
//
//  Created by Yash on 01/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import Foundation


struct RSSItem{
    var title: String
    var description: String
}

class FeedParser: NSObject, XMLParserDelegate{
    private var rssItems = [RSSItem]()
    private var currentElement = ""
    private var currentTitle = ""
    private var currentDescription = ""
    
    private var parseComplitionHandler : (([RSSItem]) -> Void)?
    
    func parseFeed(url: String, complitionHandler: (([RSSItem]) -> Void)? ){
        self.parseComplitionHandler = complitionHandler
        
        let request =  URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response , error) in
            guard let data = data else{
                if let error = error{
                    print(error.localizedDescription)
                }
                return
            }
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        task.resume()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item"{
            currentTitle = ""
            currentDescription = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement{
            case "title": currentTitle += string
            case "description" : currentDescription += string
            default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item"{
            let rssItem = RSSItem(title: currentTitle, description: currentDescription)
            self.rssItems.append(rssItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parseComplitionHandler!(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
    
}
