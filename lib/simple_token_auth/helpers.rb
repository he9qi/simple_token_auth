# https://github.com/plataformatec/devise
#
module SimpleTokenAuth
  module Helpers
    # Generate a friendly string randomly to be used as token.
    def friendly_token
      SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
    end

    # constant-time comparison algorithm to prevent timing attacks
    def secure_compare(a, b)
      return false if a.blank? || b.blank? || a.bytesize != b.bytesize
      l = a.unpack "C#{a.bytesize}"

      res = 0
      b.each_byte { |byte| res |= byte ^ l.shift }
      res == 0
    end
  end
end
