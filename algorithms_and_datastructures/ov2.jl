

#Takes in the head of a linked list containing list_element.value and list_element.next attributes
#and returns the maximum element in the list in O(n) time.

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
