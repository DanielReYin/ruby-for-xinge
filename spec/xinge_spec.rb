require 'spec_helper'

#run bundle exec rspec spec
#
describe Xinge do
  before(:all) do
    #将token环境变量预先配置到你的 .bashrc 或者 .zshrc 文件当中
    #如果要设置多个，请用逗号分隔
    #example: export XINGE_TEST_TOKENS='xxxx,xxxx'
    @android_device_tokens = ENV['XINGE_ANDROID_TEST_TOKENS'] && ENV['XINGE_ANDROID_TEST_TOKENS'].split(',') || []
    @ios_device_tokens = ENV['XINGE_IOS_TEST_TOKENS'] && ENV['XINGE_IOS_TEST_TOKENS'].split(',') || []

  end
  it 'has a version number' do
    expect(Xinge::VERSION).not_to be nil
  end

  # it 'can push to a android device' do
  #   #puts Xinge.config
  #   @android_device_tokens.each do |token|
  #     expect(
  #       Xinge::Notification.instance.android.pushToSingleDevice(token,
  #         'Xinge_Title',
  #         'Xinge😬_测试内容：演唱会，有小伙伴发现场直击啦，快来围观现场的感动，一起加入，假装在现场演唱会，有小伙伴发现场直击啦，快来围观现场的感动，一起加入，假装在现场',
  #         {},
  #         {OPEN_CONCERT_ID_KEY: 4037})['ret_code']
  #       ).to eq(0)
  #   end
  #   puts Xinge.config
  #
  #   @ios_device_tokens.each do |token|
  #     expect(Xinge::Notification.instance.ios.pushToSingleDevice(token, '关注了你。', '操蛋子', {}, {OPEN_CONCERT_ID_KEY: 4037})['ret_code']).to eq(0)
  #   end
  #
  # end

  it 'can push a more than one device' do
    expect(Xinge::Notification.instance.android.pushToMultiDevices(@android_device_tokens, '关注了你。', "#发现你的范儿#猜你喜欢的黄晓明近期将在东莞举办演唱会,快来扎堆看看!", {}, {OPEN_CONCERT_ID_KEY: 4037})['ret_code']).to eq(0)
  end

  #it 'can send message to all ios device' do
    #expect(Xinge::Notification.instance.ios.pushToAllDevice('','hello,ios device')).to eq([0,nil])
  #end
  #it 'can send message to all ios and android' do
    #expect(Xinge::Notification.instance.send_simple_to_all('','all device, 你们好吗？')).to eq([[0,nil],[0,nil]])
  #end

end
