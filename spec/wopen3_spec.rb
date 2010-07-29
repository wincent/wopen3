require File.expand_path('spec_helper', File.dirname(__FILE__))

describe Wopen3 do
  describe 'system' do
    context 'success' do
      before do
        @result = Wopen3.system('spec/tools/succeeds.sh')
      end

      it 'captures stdout' do
        @result.stdout.should == "success!\n"
      end

      it 'captures stderr' do
        @result.stderr.should == ''
      end

      it 'captures the exit status' do
        @result.status.should == 0
      end

      it 'reports success' do
        @result.should be_success
      end
    end

    context 'failure' do
      before do
        @result = Wopen3.system('spec/tools/fails.sh')
      end

      it 'captures stdout' do
        @result.stdout.should == "working...\n"
      end

      it 'captures stderr' do
        @result.stderr.should == "error!\n"
      end

      it 'captures the exit status' do
        @result.status.should == 64
      end

      it 'reports failure' do
        @result.should_not be_success
      end
    end

    context 'file not found' do
      before do
        @result = Wopen3.system('spec/tools/non-existent.sh')
      end

      it 'returns a non-zero exit status' do
        @result.status.should_not == 0
      end

      it 'includes Errno::ENOENT in stderr' do
        @result.stderr.should match(/Errno::ENOENT/)
      end
    end

    context 'file not executable' do
      before do
        @result = Wopen3.system('spec/tools/not-executable.sh')
      end

      it 'returns a non-zero exit status' do
        @result.status.should_not == 0
      end

      it 'includes Errno::EACCES in stderr' do
        @result.stderr.should match(/Errno::EACCES/)
      end
    end

    context 'with parameters' do
      before do
        @result = Wopen3.system('spec/tools/hello.sh', 'world')
      end

      it 'passes parameters to the forked process' do
        @result.stdout.should == "hello, world!\n"
      end
    end
  end
end
