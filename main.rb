require 'aws-sdk'

credentials = Aws::SharedCredentials.new(profile_name: 'default')
polly = Aws::Polly::Client.new(region: 'ap-northeast-1', credentials: credentials)

response = polly.synthesize_speech({
  voice_id: 'Mizuki',
  language_code: 'ja-JP',
  text: 'にっこにっこにー',
  text_type: 'text',
  output_format: 'mp3',
  response_target: 'output.mp3',
})

puts 'Result:'
puts response
