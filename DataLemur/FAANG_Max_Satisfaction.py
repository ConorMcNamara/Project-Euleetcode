def max_satisfaction(expectations, cards):
    satisfied_teammates = 0
    cards_copy = cards.copy()
    if max(cards) < min(expectations):
        return satisfied_teammates
    else:
        for expectation in expectations:
            eligible_list = [card for card in cards_copy if card >= expectation]
            if len(eligible_list) > 0:
                eligible_card = min(eligible_list)
                cards_copy.remove(eligible_card)
                satisfied_teammates += 1
    return satisfied_teammates
