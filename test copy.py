ias =  [11,12,13]
heuristiques = [3,4,5] #jeton centre, 3 in a row, adjacence
i=0
entrees = []
corresp = []
for ia1 in ias:
  for ia in ias:
    for h in heuristiques:
      for h2 in heuristiques:
        with open(f"entrees/entree{i}.txt","w") as f:
          f.write(f"initAction.\n{ia1}.\n0.\n{h}.\n{ia}.\nend.\n{ia1}.\n0.\n{h2}.\nend.\n")
          corresp.append((ia,ia1,h,h2))
          i+=1
print("pui")