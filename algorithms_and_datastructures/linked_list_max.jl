

#The traversemax function takes in the head of a linked list
#containing list_element.value and list_element.next attributes
#and returns the maximum element in the list in O(n) time.


mutable struct Record
    next::Union{Record,Nothing}
    value::Int
end

function createlinkedlist(length, valuerange)
    next = nothing
    record = nothing
    for i in 1:length
        record = Record(next, rand(valuerange))
    end
    return record
end


function traversemax(obj)

    max = obj.value
    while obj.next != nothing
        obj = obj.next
        if obj.value > max
            max = obj.value
        end
    end
    return max
end

#Example

linked_list = createlinkedlist(10, 5:20)
print(traversemax(linked_list))
