Wopen3 is a replacement for Open3. Unlike Open3, Wopen3 does not throw away
the exit code of the executed (grandchild) process. Only a child process is
spawned and the exit status is returned in $? as normal.

Usage example:

  result, errors = '', ''
  Wopen3.popen3('git', 'log') do |stdin, stdout, stderr|
    threads = []
    threads << Thread.new(stdout) do |out|
      out.each { |line| result << line }
    end
    threads << Thread.new(stderr) do |err|
      err.each { |line| errors << line }
    end
    threads.each { |thread| thread.join }
  end
  status = $?.exitstatus
  raise "Non-zero exit status #{status}" if status != 0

As this is such a common usage pattern, a 'system' method is provided as a
convenience:

  result = Wopen3.system('git', 'log')
  result.status # => 0
  result.stderr # => ''
  result.stdout # => 'commit 491411b3...'
