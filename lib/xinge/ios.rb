require 'xinge/base'
module Xinge
  class Ios < Base

    ENV_MAP = {'production' => 1, 'development' => 2}

    def initialize(accessId = nil, secretKey = nil, options = {})
      super
    end
    def pushToSingleDevice(token, title, content, params={}, custom_content={})
      self.push_single_device(token, 0, build_simple_message(title, content, custom_content), params.merge({environment: ENV_MAP[Xinge.config[:env]] || 2}))
    end
    def pushToMultiDevices(tokens, title, content, params={}, custom_content={})
      self.push_multi_device(tokens, 1, build_simple_message(title, content, custom_content), params)
    end
    def pushToAllDevice(title, content, params={}, custom_content={})
      self.push_all_device(0, build_simple_message(title, content, custom_content), params.merge({environment: ENV_MAP[Xinge.config[:env]] || 2}))
    end

    protected

    def build_simple_message(title, content, custom_content)
      {
        aps: {
          alert: {
            title: title,
            body: content
          },
          sound: 'default',
          badge: 1
        }
      }.merge(custom_content).to_json
    end
  end
end
