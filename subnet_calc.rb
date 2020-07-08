t = ARGV[0].to_i
ans = String.new
t.times do |t|

  # question
  ans+="#{t+1}\n"
  print '%02d: ' % (t+1)
  ary = [rand(0..255),rand(0..255),rand(0..255),rand(0..255)]
  sub = rand(1..31)
  tar = sub/8
  que = String.new
  ary.each {|t| que+="#{t}."}
  print que.chop!
  puts " /#{sub}"

  # NW
  (tar).times { |t| ans+= "#{ary[t]}."}
  pow = (2**(8-sub%8))
  ans += "#{((ary[tar] / pow)*pow)}."
  ((tar+1)..3).each { ans+= "0."}
  ans.chop!
  ans+="\n"

  # BR
  (tar).times { |t| ans+= "#{ary[t]}."}
  pow = (2**(8-sub%8))
  ans+="#{((ary[tar] / pow)*pow+pow-1)}."
  ((tar+1)..3).each { ans+= "255."}
  ans.chop!
  ans+="\n\n"
end

# asnwer
File.open('./ans.txt', 'w') do |f|
  f.puts ans
end