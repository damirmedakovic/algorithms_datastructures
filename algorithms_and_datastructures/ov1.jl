

#insertionsort! takes in an array of numbers and returns
#the sorted array in O(n^2) time.

function insertionsort!(A)
    for j in 2:length(A)
        key = A[j]
        i = j - 1

        while i > 0 && A[i] > key
            A[i+1] = A[i]
            i = i - 1
        end
        A[i+1] = key
    end
    return A
end

#Example

print(insertionsort!([5,3,2,1]))
