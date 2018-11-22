
#bisect_left/right are modified versions of binary search


function bisect_left(A, p, r, v)
    i = p
    if p < r
       q = floor(Int, (p+r)/2)
       if v <= A[q]
           i = bisect_left(A, p, q, v)
       else
           i = bisect_left(A, q+1, r, v)
       end
    end
    return i
end


function bisect_right(A, p, r, v)
    i = p
    if p < r
       q = floor(Int, (p+r)/2)
       if v < A[q]
           i = bisect_right(A, p, q, v)
       else
           i = bisect_right(A, q+1, r, v)
       end
    end
    return i
end



#merge! is the subroutine of merge_sort!, which sorts an array of integers
#in n*lg(n) time complexity in the worst/average/best case. This is the best
#a comparison-based algorithm can do. 

function merge!(A, p, q, r)

    n1 = q - p + 1
    n2 = r - q
    L = Array{Float32, 1}(undef, n1 + 1)
    R = Array{Float32, 1}(undef, n2 + 1)

    for i in 1:n1
        L[i] = A[p + i - 1]

    end

    for j in 1:n2
        R[j] = A[q + j]

    end

    L[n1 + 1] = Inf32
    R[n2 + 1] = Inf32

    i = 1
    j = 1

    for k in p:r

        if L[i] <= R[j]
            A[k] = L[i]
            i = i + 1
            println(L[i],"---", R[j])
        else
            A[k] = R[j]
            j = j + 1

        end
    end

    print("A", A)
end

function merge_sort!(A, p, r)
    if p < r
        q = Int64(floor((p + r)/2))
        merge_sort!(A, p, q)
        merge_sort!(A, q+1, r)
        merge!(A, p, q, r)
    end
end

a = [5,3,8, 7, 11, 9, 4, 6, 2, 1]
b = map(Float32, a)


merge_sort!(b, 1, 10)
