# LOOP
animals = ['cat', 'dog', 'monkey']
for idx, animal in enumerate(animals):
    print('#%d: %s' % (idx + 1, animal))
    # "#1: cat", "#2: dog", "#3: monkey"

d = {'person': 2, 'cat': 4, 'spider': 8}
for animal, legs in d.items():
    print('A %s has %d legs' % (animal, legs))
    # "A person has 2 legs", "A cat has 4 legs", "A spider has 8 legs"