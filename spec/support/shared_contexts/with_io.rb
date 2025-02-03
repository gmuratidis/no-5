# frozen_string_literal: true

RSpec.shared_context 'with IO' do
  let(:stdin) { StringIO.new }
  let(:stdout) { StringIO.new }

  let(:input) { [] }

  before do
    [*input].each { |command| stdin.puts command }

    stdin.puts '__end__'

    stdin.rewind
  end
end
