require_relative 'spec_helper.rb'
require_relative '../bf.rb'

describe "BrainfuckInt"  do
    let(:br) { BrainfuckInt.new('./test/helloworld.bf') }
    let(:cbr) { BrainfuckInt.new('./test/cipher.bf') }

    describe ".new" do
        it "Should have memory limit of 32KB" do
            expect(br.mem_limit).to eq (32 * 1024)
        end

        it "Should read code from ./test/helloworld.bf" do
            expect(br.code.join('')).to eq "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
        end

        it "Should have pc value of 0" do
            expect(br.pc).to eq 0
        end

        it "Should have memory pointer set to 0" do
            expect(br.mem_ptr).to eq 0
        end

        it "Should have no buffer content" do
            expect(br.buffer.length).to eq 0
        end
    end

    describe ".parse" do
        it "Should output Hello World!" do
            expect(capture_standard_output { br.parse }).to eq 'Hello World!'
        end

        it "Should correctly encrypt letter a" do
            allow(STDIN).to receive(:gets) { "a\n" }
            expect(capture_standard_output { cbr.parse }).to eq '-----'
        end

        it "Should correctly encrypt letter w" do
            allow(STDIN).to receive(:gets) { "w\n" }
            expect(capture_standard_output { cbr.parse }).to eq '*-**-'
        end
    end
end
