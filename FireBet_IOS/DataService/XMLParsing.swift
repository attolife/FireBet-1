//
//  XMLParsing.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/20/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import Foundation

enum XMLParsingError: Error
{
  case unknown
}

func parseXML<T>(_ data: Data, elementName: String) throws -> [T] where T: JSONDecodable
{
  let parser = XMLParser(data: data)
  let parserDelegate = XMLObjectDecoder(elementName)
  
  parser.delegate = parserDelegate
  
  if !parser.parse() {
    throw parser.parserError ?? XMLParsingError.unknown
  }
  
  let objects: [JSONObject] = parserDelegate.parsedObjects
  return try objects.map(decode)
}

class XMLObjectDecoder: NSObject, XMLParserDelegate
{
  private(set) var parsedObjects: [JSONObject] = []
  
  func parserDidStartDocument(_ parser: XMLParser) {
    parsedObjects = []
  }
  
  let elementName: String
  init(_ elementName: String)
  {
    self.elementName = elementName
  }
  
  private var currentElementData: JSONObject?
  private var currentKey: String?
  
  func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
    
    if elementName == self.elementName
    {
      currentElementData = [:]
    }
    else {
      currentKey = elementName
    }
  }
  
  private var currentValue: String?
  func parser(_ parser: XMLParser, foundCharacters string: String) {
    if currentValue == nil
    {
      currentValue = String()
    }
    currentValue?.append(string)
  }
  
  func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    defer {
      currentValue = nil
      currentKey = nil
    }
    
    if elementName == self.elementName, let currentElementData = currentElementData
    {
      parsedObjects.append(currentElementData)
      self.currentElementData = nil
    }
    else if let currentKey = currentKey, let currentValue = currentValue
    {
      currentElementData?[currentKey] = currentValue
    }
  }
}













