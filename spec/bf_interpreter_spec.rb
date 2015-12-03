require_relative 'spec_helper.rb'
require_relative '../bf.rb'

describe "BrainfuckInt"  do
    let(:br) { BrainfuckInt.new('./test/helloworld.bf') }

    describe ".new" do
        it "Should have memory limit of 32KB" do
            expect(br.mem_limit).to eq (32 * 1024)
        end
    end
end
