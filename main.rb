require 'aws-sdk'

credentials = Aws::SharedCredentials.new(profile_name: 'default')
polly = Aws::Polly::Client.new(region: 'ap-northeast-1', credentials: credentials)

begin
  polly.synthesize_speech({
    voice_id: 'Joanna',
    text: 'Hello',
    text_type: 'text',
    output_format: 'mp3',
    response_target: 'output.mp3',
  })
rescue Aws::Polly::Errors::ServiceError => e
  puts 'Fatal error!'
  puts e
end
