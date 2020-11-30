require 'thread'
@music = Mutex.new
@violin = ConditionVariable.new
@bow = ConditionVariable.new
@violins_free = 2
@bows_free = 1
def musician(n)
  loop do
  sleep rand(0)

  @music.synchronize do
  @violin.wait(@music) while @violins_free == 0
  @violins_free -= 1
  puts "#{n} владеет скрипкой"
  puts "скрипок #@violins_free, смычков #@bows_free"
  @bow.wait(@music) while @bows_free == 0
  @bows_free -= 1
  puts "#{n} владеет смычком"
  puts "скрипок #@violins_free, смычков #@bows_free"
  end
  sleep rand(0)
  puts "#{n}: (...играет...)"
  sleep rand(0)
  puts "#{n}: Я закончил."
  @music.synchronize do
  @violins_free += 1
  @violin.signal if @violins_free == 1
  @bows_free += 1
  @bow.signal if @bows_free == 1
  end
  end
end
threads = []
3.times {|i| threads << Thread.new { musician(i) } }
threads.each {|t| t.join }