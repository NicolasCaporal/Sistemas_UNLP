# Desafío 4
# Queremos implementar una función que, dada una agenda de contactos con información 
# de personas que compiten en distintos esports, nos retorne la agenda ordenada de
# acuerdo al nick. Tenemos registrada la siguiente info: nick_name, equipo, TW, esport

agenda = [("Battaglia", "Boca", "@fulanocabj012", "CS:GO"), ("Zitra", "Isurus", "@menganoisurus", "Lol"), ("Arnold", "KRU", "@zuvaj", "RL")]

nicknames = map(lambda x: x[0], agenda)
agenda = [sorted(nicknames, key=str.lower)]

print(agenda)