#!/usr/bin/env ruby

class Codeur
	#attr_accessor :chaine_codee
	def initialize(clef="pardefaut")
		@clef=[]
		if clef.respond_to?("each_byte")
			clef.each_byte {|c| @clef << c}
		end	
	end

	def coder_chaine(chaine_a_coder)
		chaine_codee = ""
		i = 0
		if chaine_a_coder.nil?
			puts "chaine vide"
		elsif not chaine_a_coder.ascii_only?
			puts "chaine non valide"
		elsif chaine_a_coder.respond_to?("each_byte")
			chaine_a_coder_b=chaine_a_coder.bytes
			chaine_a_coder.each_byte do |iterateur|
				c_iterateur = @clef.at(i % @clef.length )
				#puts iterateur
				#puts c_iterateur
				#puts i % @clef.length 
				#puts (iterateur ^ c_iterateur).chr
				i += 1
				chaine_codee += (iterateur ^ c_iterateur).chr
			end
		end
	return chaine_codee
	end
end

if __FILE__ == $0
	if ARGV[1].nil?
		c = Codeur.new("clef")
		puts "Aucune clef passe en argument, utilisation d'une clef par defaut"
	elsif ARGV[1].ascii_only?
		c = Codeur.new(ARGV[1])
	else
		raise "clef non valide"
	end
	if  ARGV[0].nil?
		#puts ARGV[0]
		puts "Erreur : Aucun argument"
	else
		puts c.coder_chaine(ARGV[0])
		#puts temp
		#puts c.coder_chaine(temp)
	end
end
