class Post < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true
    validates :content, presence: true

    before_save :censura

    def censura
        palabras_censuradas = ["spoiler", "Spoiler", "SPOILER"]
        palabras_censuradas.each do |word|
           
            palabra_temporal = self.content.partition(/#{Regexp.quote(word)}/)
            
            if palabra_temporal[1] != ""
                self.content = palabra_temporal[0].concat(palabra_temporal[-1])
            end
        end
    end
    
end
