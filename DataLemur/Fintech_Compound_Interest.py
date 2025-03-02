def compound_interest(principal, rate, contribution, years):
    amount = principal
    for year in range(years):
      amount *= (1 + (rate / 100))
      amount += contribution
    return round(amount, 2)