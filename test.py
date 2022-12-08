import subprocess
import openpyxl

NBREP = 100
NBENTRE = 81
ias =  [11,12,13]
heuristiques = [3,4,5] #jeton centre, 3 in a row, adjacence
i=0
corresp = []
for ia1 in ias:
  for ia in ias:
    for h in heuristiques:
      for h2 in heuristiques:
        
        corresp.append((ia,ia1,h,h2))
        i+=1

# Create a new Excel workbook
wb = openpyxl.Workbook()

# Get the active sheet in the workbook
sheet = wb.active
sheet.append(["IA1","IA2","H1","H2","VR","VJ","EGAL", "NBCOUP"])

for j in range (0,20):
  nbR = 0
  nbJ = 0
  nbE = 0
  nbCoup=0 
  
  
  for i in range(NBREP):
    with open(f"entrees/entree{j}.txt","r") as entree:
      with open (f"sorties/sortie.txt","w") as f:
        p = subprocess.Popen("swipl .\websimulate.pl", stdin=entree, stdout=f)
        p.wait()
      with open(f"sorties/sortie.txt","r") as f:
        gagnant = "egalité"
        text = f.read()
          # Search for the string
        index = text.find('rouge a gagn')
        nbCoup += text.count("C'est au joueur")
        
        if index != -1:
          gagnant = "rouge"
          nbR+=1

        index = text.find('jaune a gagn')
        if index != -1:
          gagnant = "jaune"
          nbJ+=1

  nbE = NBREP - (nbJ+nbR)
  
  entr = corresp[j]
  sheet.append([entr[0],entr[1],entr[2],entr[3],nbR, nbJ, nbE, nbCoup/NBREP])
  print(nbE, nbJ, nbR)

wb.save("output2.xlsx")