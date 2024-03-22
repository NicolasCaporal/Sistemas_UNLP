import datetime
#import locale
#locale.setlocale(locale.LC_ALL, 'es_ES.utf8')  # esto por si lo piden en español

fecha_hora_actual = datetime.datetime.now() # obtengo la fecha y hora actual
fecha_actual = fecha_hora_actual.strftime("%A %d/%m/%y, %H:%M:%S")
#print(fecha_hora_actual.strftime("%A %d/%m/%y, %H:%M:%S"))

