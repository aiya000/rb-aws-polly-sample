require 'aws-sdk'

credentials = Aws::SharedCredentials.new(profile_name: 'default')
polly = Aws::Polly::Client.new(region: 'ap-northeast-1', credentials: credentials)

response = polly.synthesize_speech({
  voice_id: 'Mizuki',
  language_code: 'ja-JP',
  output_format: 'mp3',
  response_target: 'output.mp3',
  text_type: 'text',
  text: '
    ある日の暮方の事である。
    一人の下人が、羅生門の下で雨やみを待っていた。
    広い門の下には、この男のほかに誰もいない。
    ただ、所々丹塗の剥げた、大きな円柱に、蟋蟀が一匹とまっている。
    羅生門が、朱雀大路にある以上は、この男のほかにも、雨やみをする市女笠揉烏帽子が、もう二三人はありそうなものである。
    それが、この男のほかには誰もいない。
  ',
})

puts 'Result:'
puts response
