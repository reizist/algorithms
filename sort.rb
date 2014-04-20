class Sort
  def bubble_sort(a)
    i = 0
    while i < a.length
      j = a.length - 1
      while j > i
        if a[i] > a[j]
          tmp = a[i]
          a[i] = a[j]
          a[j] = tmp
        end
        j -= 1
      end
      i += 1
    end

  end

  def quick_sort(a,i,j)
    def pivot(a,i,j)
      k = i+1
      while(k <= j && a[i]==a[k])
        k += 1
      end
        return -1 if k>j
        return i if a[i] >= a[k]
        return k
    end

    def partition(a,i,j,x)
      l,r = i,j
      while(l<=r)
        while(l <= j && a[l] < x)
          l += 1
        end
        while(r >= i && a[r] >= x)
          r -= 1
        end
        if(l > r)
          break
        end
        a[l],a[r] = a[r],a[l]
        l += 1
        r -= 1
      end
      return l
    end

    return if i==j
    p = pivot(a,i,j)
    if(p != -1)
      k = partition(a,i,j,a[p])
      quick_sort(a,i,k-1)
      quick_sort(a,k,j)
    end
  end

  def merge_sort(a)
    def merge(a1,a2,a)
      i,j = 0,0
      while(i<a1.length || j < a2.length)
        if(j >= a2.length || (i < a1.length && a1[i] < a2[j]))
          a[i+j] = a1[i]
          i += 1
        else
          a[i+j] = a2[j]
          j += 1
        end
      end
    end

    if(a.length > 1)
      m = a.length / 2
      n = a.length - m

      a1 = Array.new
      a2 = Array.new
      (0...m).each do |i|
        a1[i] = a[i]
      end
      (0...n).each do |i|
        a2[i] = a[m+i]
      end
      merge_sort(a1)
      merge_sort(a2)
      merge(a1,a2,a)
    end
  end

  array = (1..10000).to_a.sort_by{rand}
  #p array
  sort = Sort.new()

  a = array.clone
  start_time = Time.now
  sort.bubble_sort(a)
  end_time = Time.now
  p ("bubleSort:" + (end_time - start_time).to_s + "s")

  a = array.clone
  start_time = Time.now
  sort.merge_sort(a)
  end_time = Time.now
  p ("mergeSort:" + (end_time - start_time).to_s + "s")

  a = array.clone
  start_time = Time.now
  sort.quick_sort(a,0,a.length-1)
  end_time = Time.now
  p ("quickSort:" + (end_time - start_time).to_s + "s")

  #p a
end