import subprocess
"""
ias =  [11,12,13]
heuristiques = [3,4,5] #jeton centre, 3 in a row, adjacence
i=0
for ia1 in ias:
  for ia in ias:
    for h in heuristiques:
      for h2 in heuristiques:
        with open(f"entrees/entree{i}.txt",'w') as f:
          f.write(f"initAction.\n{ia1}.\n0.\n{h}.\n{ia}.\nend.\n{ia1}.\n 0.\n{h2}.\nend.\n")
        i = i+1
"""
nbR = 0
nbJ = 0
nbE = 0

for i in range (3) :
  p = subprocess.Popen("swipl .\websimulate.pl", stdin=open("entree.txt",'r'), stdout=open("sortie.txt",'w'))
  p.wait()
  gagnant = "egalité"
  with open("sortie.txt",'r') as f:
      text = f.read()
        # Search for the string
      index = text.find('rouge a gagn')
      if index != -1:
        gagnant = "rouge"
        nbR=+1

      index = text.find('jaune a gagn')
      if index != -1:
        gagnant = "jaune"
        nbJ+=1

nbE = 100 - (nbJ+nbR)
      
    
print(nbE, nbJ, nbR)

