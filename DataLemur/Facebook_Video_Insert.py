def can_insert_ads(feed_items, n):
    num_spots = 0
    len_feed = len(feed_items)
    for i in range(len_feed):
        if feed_items[i] == 0:
            if i == 0:
                num_spots += 1
            elif i + 1 == len_feed:
                num_spots += 1
            elif feed_items[i + 1] == 0:
                num_spots += 1
            else:
                continue
        if num_spots == n:
            return True
    return False
