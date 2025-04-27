import Foundation

extension Bundle
{
 public var buildVersionNumber: String
 {
  guard let version: String = infoDictionary?["CFBundleVersion"] as? String
  else { return "?" }
  
  return version
 }
 
 public var bundleIdentifierVersioned: String
 {
  let id: String = Bundle.main.bundleIdentifier ?? "No bundle identifier"
  let version: String = fullVersionNumber
  
  return "\(id) v.\(version)"
 }

 public var fullVersionNumber: String { fullVersionNumber() }

 public func fullVersionNumber(format: String = "%@ (%@)") -> String
 {
  return String(format: format, releaseVersionNumber, buildVersionNumber)
 }
 
 public var releaseVersionNumber: String
 {
  guard let version: String = infoDictionary?["CFBundleShortVersionString"] as? String
  else { return "?" }
  
  return version
 }
}
