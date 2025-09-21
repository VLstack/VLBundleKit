import Foundation

extension Bundle
{
 /// Returns the localized string for the given key, optionally using a fallback bundle.
 ///
 /// - Parameters:
 ///   - key: The key to look up.
 ///   - value: The value to return if the key is not found (default nil).
 ///   - table: The .strings table to search (default nil).
 ///   - fallbackModule: The bundle to use as a fallback if the key is not found in `self`.
 ///   - debugUntranslated: If true and in DEBUG mode, triggers a fatalError when translation is missing (default false).
 /// - Returns: The localized string if found, otherwise the key itself.
 public func localizedString(_ key: String,
                             value: String? = nil,
                             table: String? = nil,
                             fallbackModule: Bundle,
                             debugUntranslated: Bool = false) -> String
 {
  let I18N = self.localizedString(forKey: key,
                                  value: value,
                                  table: table)
  if I18N != key { return I18N }

  let moduleI18N = fallbackModule.localizedString(forKey: key,
                                                  value: value,
                                                  table: table)
  if moduleI18N != key { return moduleI18N }

  #if DEBUG
  if debugUntranslated
  {
   fatalError("Missing translation for: \(key)")
  }
  #endif

  return key
 }
}
