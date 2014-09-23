def conversation 
  puts "your"
  yield
  puts "stinks"
end

conversation { puts "butt" }

def five_times
  1.upto 5 do |n|
    yield n
  end
end

five_times do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end

def n_times number
  1.upto number do |n|
    yield n
  end
end

n_times 10 do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end