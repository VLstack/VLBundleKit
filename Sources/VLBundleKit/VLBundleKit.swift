import Foundation

public extension Bundle
{
 var buildVersionNumber: String
 {
  guard let version: String = infoDictionary?["CFBundleVersion"] as? String
  else { return "?" }
  
  return version
 }
 
 var bundleIdentifierVersioned: String
 {
  let id: String = Bundle.main.bundleIdentifier ?? "No bundle identifier"
  let version: String = fullVersionNumber
  
  return "\(id) v.\(version)"
 }

 var fullVersionNumber: String { fullVersionNumber() }
 
 func fullVersionNumber(format: String = "%@ (%@)") -> String
 {
  return String(format: format, releaseVersionNumber, buildVersionNumber)
 }
 
 var releaseVersionNumber: String
 {
  guard let version: String = infoDictionary?["CFBundleShortVersionString"] as? String
  else { return "?" }
  
  return version
 }
}
