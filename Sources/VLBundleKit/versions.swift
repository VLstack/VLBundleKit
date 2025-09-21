import Foundation

extension Bundle
{
 /// The build version number of the bundle, taken from `CFBundleVersion`.
 ///
 /// - Returns: A `String` representing the build number, or `"?"` if unavailable.
 public var buildVersionNumber: String
 {
  guard let version: String = infoDictionary?["CFBundleVersion"] as? String
  else { return "?" }
  
  return version
 }

 /// The bundle identifier combined with the full version number.
 ///
 /// - Returns: A `String` containing the bundle identifier and version number.
 public var bundleIdentifierVersioned: String
 {
  let id: String = Bundle.main.bundleIdentifier ?? "No bundle identifier"
  let version: String = fullVersionNumber
  
  return "\(id) v.\(version)"
 }

 /// The full version string of the bundle, combining release and build versions.
 ///
 /// - Note: Equivalent to calling `fullVersionNumber(format:)` with the default format.
 /// - Returns: A `String` representing the release version and build version.
 public var fullVersionNumber: String { fullVersionNumber() }

 /// The full version string of the bundle using a custom format.
 ///
 /// - Parameters:
 ///   - format: A `String` format expecting two placeholders:
 ///             release version and build version. Default: `"%@ (%@)"`.
 /// - Returns: A formatted `String` with the release and build version numbers.
 public func fullVersionNumber(format: String = "%@ (%@)") -> String
 {
  return String(format: format, releaseVersionNumber, buildVersionNumber)
 }
 
 /// The release version number of the bundle, taken from `CFBundleShortVersionString`.
 ///
 /// - Returns: A `String` representing the release version, or `"?"` if unavailable.
 public var releaseVersionNumber: String
 {
  guard let version: String = infoDictionary?["CFBundleShortVersionString"] as? String
  else { return "?" }
  
  return version
 }
}
