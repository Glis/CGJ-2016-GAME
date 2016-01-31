module GamesHelper
    def caesar_print rule
      tabla=""
      library="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      shifted_library=""
      library.each_char do |letter|
            shifted_library << library[library.index(letter) - rule]
      end

      str = "<table>\n<tr><th>Original </th>"
      library.each_char do |line|
      	str += "<td> #{line} </td>\n"
      end
      str += "</tr><tr><th>Cesar "+rule.to_s+ "</th>"
      shifted_library.each_char do |line|
      	str += "<td> #{line} </td>\n"
      end
      str += "</tr></talbe>\n"

      tabla="<h2>Leyenda Criptgráfica opcional</h2><br>#{str}"

      raw tabla
    end
end
