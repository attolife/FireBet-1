//
//  HTTP.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/20/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import Foundation

let session: URLSession = .shared

enum HTTPError: Error {
  case invalidResponse
  case invalidStatusCode
  case requestFailed(statusCode: Int, message: String)
}

enum HTTPStatusCode: Int
{
  case success = 200
  case notFound = 404
  
  var isSuccessful: Bool {
    return (200..<300).contains(rawValue)
  }
  
  var message: String {
    return HTTPURLResponse.localizedString(forStatusCode: rawValue)
  }
}

func validate(_ response: URLResponse?) throws
{
  guard let response = response as? HTTPURLResponse else {
    throw HTTPError.invalidResponse
  }
  guard let status = HTTPStatusCode(rawValue: response.statusCode) else {
    throw HTTPError.invalidStatusCode
  }
  if !status.isSuccessful {
    throw HTTPError.requestFailed(statusCode: status.rawValue, message: status.message)
  }
}

struct PagedResult<T>
{
  let pageNumber: Int
  let results: [T]
}
