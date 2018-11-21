require "minitest/autorun"
require "../src/piet_interpreter"

module Minitest
  class Spec < Test
    macro let(name, klass, &block)
      @{{name.id}} : {{klass}}?
      def {{ name.id }}
        @{{ name.id }} ||= begin; {{ yield }}; end
      end
    end
  end
end
