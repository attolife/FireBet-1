//
//  JSONParsing.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/20/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import Foundation

protocol JSONDecodable {
  init(_ decoder: JSONDecoder) throws
}

typealias JSONObject = [String: Any]

enum JSONParsingError: Error
{
  case missingKey(key: String)
  case typeMismatch(key: String)
}

class JSONDecoder
{
  let jsonObject: JSONObject
  init(_ jsonObject: JSONObject)
  {
    self.jsonObject = jsonObject
  }
  
  func value<T>(forKey key: String) throws -> T
  {
    guard let value = jsonObject[key] else {
      throw JSONParsingError.missingKey(key: key)
    }
    guard let finalValue = value as? T else {
      throw JSONParsingError.typeMismatch(key: key)
    }
    return finalValue
  }
  
  static let defaultDateFormat = "dd/MM/yyyy HH:mm:ss"
  private lazy var dateFormatter = DateFormatter()
  
  func value(forKey key: String, format: String = JSONDecoder.defaultDateFormat) throws -> Date
  {
    let dateValue: String = try value(forKey: key)
    dateFormatter.dateFormat = format
    guard let returnValue = dateFormatter.date(from: dateValue) else {
      throw JSONParsingError.typeMismatch(key: key)
    }
    return returnValue
  }
}

func parse<T>(_ data: Data) throws -> [T] where T: JSONDecodable
{
  let jsonObjects: [JSONObject] = try deserialize(data)
  return try jsonObjects.map(decode)
}

func deserialize(_ data: Data) throws -> [JSONObject]
{
  let json = try JSONSerialization.jsonObject(with: data, options: [])
  guard let objects = json as? [JSONObject] else { return [] }
  
  return objects
}

func decode<T>(_ jsonObject: JSONObject) throws -> T where T: JSONDecodable
{
  return try T.init(JSONDecoder(jsonObject))
}
















