require 'stuff-classifier'

mon_fichier = File.open("FinalFile.csv", "w")
# for the naive bayes implementation
cls = StuffClassifier::Bayes.new("loisir ou cuisine ou famille ")

def probabilities(word)
  probabilities = Hash.new
  @words.each_key {|category|
    probabilities[category] = probability(category, word)
  }
  return probabilities
end

loisir = File.open("YOUR_PATH\\loisirLight.txt", "r")
loisir.each_line { |ligne|
cls.train(:loisir, ligne)
}
cuisine = File.open("YOUR_PATH\\cuisineLight.txt", "r")
cuisine.each_line { |ligne|
cls.train(:cuisine, ligne)
}
famille = File.open("YOUR_PATH\\familleLight.txt", "r")
famille.each_line { |ligne|
cls.train(:famille, ligne)
}
jeu = File.open("YOUR_PATH\\jeuLight.txt", "r")
jeu.each_line { |ligne|
cls.train(:jeu, ligne)
}
adulte = File.open("YOUR_PATH\\adulteLight.txt", "r")
adulte.each_line { |ligne|
cls.train(:adulte, ligne)
}
media = File.open("YOUR_PATH\\mediaLight.txt", "r")
media.each_line { |ligne|
cls.train(:media, ligne)
}
musique = File.open("YOUR_PATH\\musiqueLight.txt", "r")
musique.each_line { |ligne|
cls.train(:musique, ligne)
}
sport = File.open("YOUR_PATH\\sportLight.txt", "r")
sport.each_line { |ligne|
cls.train(:sport, ligne)
}
technologie = File.open("YOUR_PATH\\technologieLight.txt", "r")
technologie.each_line { |ligne|
cls.train(:technologie, ligne)
}
travail = File.open("YOUR_PATH\\travailLight.txt", "r")
travail.each_line { |ligne|
cls.train(:travail, ligne)
}
voyage = File.open("YOUR_PATH\\voyageLight.txt", "r")
voyage.each_line { |ligne|
cls.train(:voyage, ligne)
}

test = File.open("oneDay.csv", "r")
test.each_line { |ligne|
domain = ligne.split(",")
ligneCal = domain[3]

resMed = cls.doc_prob(ligneCal,:media)
resMus = cls.doc_prob(ligneCal,:musique)
resLoi = cls.doc_prob(ligneCal,:loisir)
resCui = cls.doc_prob(ligneCal,:cuisine)
resFam = cls.doc_prob(ligneCal,:famille)
resJeu = cls.doc_prob(ligneCal,:jeu)
resAdu = cls.doc_prob(ligneCal,:adulte)
resSpo = cls.doc_prob(ligneCal,:sport)
resTec = cls.doc_prob(ligneCal,:technologie)
resTra = cls.doc_prob(ligneCal,:travail)
resVoy = cls.doc_prob(ligneCal,:voyage)


max = [resMed,resMus,resLoi,resCui,resFam,resJeu,resAdu,resSpo,resTec,resTra,resVoy].max
array = [resMed,resMus,resLoi,resCui,resFam,resJeu,resAdu,resSpo,resTec,resTra,resVoy]

submax0 = (max - array[0]).abs
submax1 = (max - array[1]).abs
submax2 = (max - array[2]).abs
submax3 = (max - array[3]).abs
submax4 = (max - array[4]).abs
submax5 = (max - array[5]).abs
submax6 = (max - array[6]).abs
submax7 = (max - array[7]).abs
submax8 = (max - array[8]).abs
submax9 = (max - array[9]).abs
submax10 = (max - array[10]).abs

res = ''
resTmp0 = ''
resTmp1 = ''
resTmp2 = ''
resTmp3 = ''
resTmp4 = ''
resTmp5 = ''
resTmp6 = ''
resTmp7 = ''
resTmp8 = ''
resTmp9 = ''
resTmp10 = ''

if max > 0.10
	if submax0 == 0 
		res = 'Media'
		else if submax0 < 0.01
			resTmp0 = 'Media'
		end
	end
		
	if submax1 == 0 
		res = 'Musique'
		else if submax1 < 0.01
			resTmp1 = 'Musique'
		end
	end
	
	if submax2 == 0 
		resTmp = 'Loisir'
		else if submax2 < 0.01
			resTmp2 = 'Loisir'
		end
	end
	
	if submax3 == 0 
		res = 'Cuisine'
		else if submax3 < 0.01
			resTmp3 = 'Cuisine'
		end
	end
		
	if submax4 == 0 
		res = 'Famille'
	else if submax4 < 0.01
		resTmp4 = 'Famille'
		end
	end
		
	if submax5 == 0 
		res = 'Jeu'
	else if submax5 < 0.01
		resTmp5 = 'Jeu'
		end
	end
		
	if submax6 == 0 
		res = 'Adulte'
	else if submax6 < 0.01
		resTmp6 = 'Adulte'
		end
	end
	
	if submax7 == 0 
		res = 'Sport'
	else if submax7 < 0.01
		resTmp7 = 'Sport'
		end
	end
	
	if submax8 == 0 
		res = 'Technologie'
	else if submax8 < 0.01
		resTmp8 = 'Technologie'
		end
	end
	
	if submax9 == 0 
		res = 'Travail'
	else if submax9 < 0.01
		resTmp9 = 'Travail'
		end
	end
	
	if submax10 == 0 
		res = 'Voyage'
	else if submax10 < 0.01
		resTmp10 = 'Voyage'
		end
	end
end

	mon_fichier.write(ligne.chomp + ',' + resTmp0 + ',' + resTmp1 + ',' + resTmp2 + ',' + resTmp3 + ',' + resTmp4 + ',' + resTmp5 + ',' + resTmp6+',' + resTmp7 + ',' + resTmp8 + ','+ resTmp9 + ',' + resTmp10 + ',' + res)
	mon_fichier.write("\n")
}

