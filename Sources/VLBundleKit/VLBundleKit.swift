import Foundation

public extension Bundle
{
 var releaseVersionNumber: String
 {
  guard let version: String = infoDictionary?["CFBundleShortVersionString"] as? String
  else { return "?" }
  
  return version
 }
 
 var buildVersionNumber: String
 {
  guard let version: String = infoDictionary?["CFBundleVersion"] as? String
  else { return "?" }
  
  return version
 }
 
 var fullVersionNumber: String { fullVersionNumber() }
 
 func fullVersionNumber(format: String = "%@ (%@)") -> String
 {
  return String(format: format, releaseVersionNumber, buildVersionNumber)
 }
}
