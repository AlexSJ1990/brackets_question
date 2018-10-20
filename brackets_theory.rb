
    brackets = [4, 2, 5, 5, 3, 3, 2, 4]

    return "the brackets are uneven" if brackets.length.even? == false

    closed_brackets = 0

    brackets.each_with_index do |bracket, index|
        # should you check if the current bracket is a closing one to end this loop sooner?
        checked_position = index + 1
        # here you are checking if the bracket's next bracket closes it, is that right?
        closed_brackets += 1 if brackets[checked_position].closes(brackets[index])
        # Now, you check again on the same bracket if something else closes it again, couldn't it cause an issue?
        # Say if you have multiple opening and closing square brackets, you would count 4 times instead of 2?
        # You check if you are on an even index or not and then will set the end check accordingly to the last or second to last
        # element.
        end_check = index.even? ? brackets.length - 1 : brackets.length - 2
        # For the rest of the array, you go up two brackets per two brackets (good idea) and check if it closes it.
        # No need to do this for the last two as they will be handled above.
        while checked_position + 2 <= end_check
            checked_position += 2
            closed_brackets += 1 if brackets[checked_position].closes(brackets[index])
        end
    end

    if closed_brackets == brackets.length / 2
        p "there are #{closed_brackets} sets of closed brackets - they all close"
    else
        p "there are #{closed_brackets} sets of closed brackets they do not all close"
    end
