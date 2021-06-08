require 'uri'
require 'net/http'
require 'nokogiri'
require 'pry-byebug'


# https://www.twilio.com/blog/5-ways-make-http-requests-ruby

url = 'https://www.was-steht-auf-dem-ei.de/index.php'

uri = URI(url)

# egg = 0-DE-1200112
form_data = {
  system: 1,
  country:  'DE',
  company:  1300111,
  securityToken:  '28ce931bf4fb5a63f7f0ec709e2c552f'
}

uri.query = URI.encode_www_form(form_data)
res = Net::HTTP.get_response(uri)

p res
p res.class

# if res.code == '200' # https://ruby-doc.org/stdlib-2.4.1/libdoc/net/http/rdoc/Net/HTTP.html

html_doc = Nokogiri::HTML(res.body)

text = html_doc.search('#coderesult > div.data').text.strip
p text

binding.pry
# end