import Foundation

extension Bundle
{
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
