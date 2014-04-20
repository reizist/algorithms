class Prime
end

def my_count_prime(max)
  #配列作成
  array = Array.new
  #配列初期化
  (0..max).each do |i|
    array[i] = 1
  end
  #0,1は素数じゃない,2は素数
  array[0],array[1],array[2] = 0,0,1

  #3から最大値まで走査
  (3..max).each do |i|
    #奇数のみ素数対象
    if i % 2 != 0
      if array[i] != 0
        (i+1..max).each do |j|
          if i % 2 == 0
            next
          end
          #既に走査した値の倍数を対象外に
          if j % i == 0
            array[j] = 0
          end
        end
      end
    else
      array[i] = 0
    end
  end

  #素数の個数をカウント
  count = 0
  (0...array.length).each do |i|
    if array[i] == 1
      #print i.to_s + " "
      count += 1
    end
  end
  #print "\n"
  return count
end

def eratosthenes_count_prime(max)
  #最終的な素数配列
  ans_array = (2..max).to_a
  2.upto(Math.sqrt(max)) do |num|
    ans_array.reject!{|elem| (elem % num == 0) && (elem > num)}
  end
  #p ans_array
end



print "最大値（整数): "
max = STDIN.gets.chomp.to_i

start_time = Time.now
my_count_prime(max)
end_time = Time.now
p("ゴリ押し:" + (end_time - start_time).to_s + "s")


start_time = Time.now
eratosthenes_count_prime(max)
end_time = Time.now
p("エラトステネスの篩:" + (end_time - start_time).to_s + "s")