module GamesHelper
    def caesar_print rule
      tabla=""
      library="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      shifted_library=""
      library.each_char do |letter|
            shifted_library << library[library.index(letter) - rule]
      end

      str = "<table><thead>\n<tr>"
      library.each_char do |line|
      	str += "<th> #{line} </th>\n"
      end
      str += "</tr><thead></tbody><tr>"
      shifted_library.each_char do |line|
      	str += "<td> #{line} </td>\n"
      end
      str += "</tr></tbody></table>\n"

      tabla="<h3 class='text-center cipher-help'>The Caesar Code: shift your letters 2 behind!</h3><br><div class='ciphertable'>#{str}</div>"

      raw tabla
    end
end
