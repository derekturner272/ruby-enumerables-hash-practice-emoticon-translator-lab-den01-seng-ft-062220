# require modules here
require "yaml"
require 'pry'
def load_library(library)
  # code goes here
  emo_hash = {}
  library = YAML.load_file('./lib/emoticons.yml')
  library.each do |name, faces|
    emo_hash[name] = {:english => faces[0], :japanese => faces[1]} 
  end
  emo_hash
end

def get_english_meaning(library, emoticon)
  # code goes here
  library = load_library('./lib/emoticons.yml')
  translation = library.keys.find do |emo|
    library[emo][:japanese] == emoticon 
  end
  if translation 
    return translation
  else 
    return "Sorry, that emoticon was not found"
  end
end 

def get_japanese_emoticon(library, emoticon)
  # code goes here
  library = load_library('./lib/emoticons.yml')
  jpn_trans = library.keys.find do |name|
    library[name][:english] == emoticon 
  end
  if jpn_trans 
    return library[jpn_trans][:japanese] 
  else 
    return "Sorry, that emoticon was not found"
  end 
end

