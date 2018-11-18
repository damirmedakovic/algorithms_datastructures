

#count_sort_letters sorts an array of strings, sorted by the letter in position p
#in linear time. It also has the stability property.

function counting_sort_letters(A, p)
    C = zeros(Int32, 26)
    for l in 1:length(A)
        C[Int(A[l][p]) - 96] = C[Int(A[l][p]) - 96] + 1
    end

    B = Array{String,1}(undef,length(A))

    for n in 2:length(C)
        C[n] = C[n] + C[n-1]
    end

    for j in length(A):-1:1
        B[C[Int(A[j][p]) - 96]] = A[j]
        C[Int(A[j][p]) - 96] = C[Int(A[j][p]) - 96] - 1
    end

    return B

end

#Example

print(counting_sort_letters(["ccc", "cba", "ca", "ab", "abc"], 2))


#counting_sort_length has the same properties as counting_sort_length, only it
#sorts by string length.

function counting_sort_length(A)

    lengths = map(length, A)
    C = zeros(Int32, maximum(lengths))

    for n in 1:length(A)
        C[lengths[n]] = C[lengths[n]] + 1
    end


    B = Array{String,1}(undef,length(A))

    for k in 2:length(A)
        C[k] = C[k] + C[k-1]
    end

    for j in length(A):-1:1
        B[C[lengths[j]]] = A[j]
        C[lengths[j]] = C[lengths[j]] - 1
    end

    return B

end

#Example

print(counting_sort_length(["bbbb", "aa", "aaaa", "ccc"]))
