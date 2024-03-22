"""
Ventana que permite generar un meme al seleccionar introducir los textos necesarios.
"""

import PySimpleGUI as sg
from unlpimage.read_data import add_logs
from unlpimage.windows import collagegen
from PIL import Image, ImageTk, ImageOps, ImageDraw, ImageFont
from unlpimage.paths import IMPACT_FONT, HELVETICA, NEUCHA, HACK
from unlpimage.paths import COLOR_ICON
from unlpimage import read_data as rd
import warnings
warnings.filterwarnings("ignore", category=UserWarning) # ignoramos las UserWarnings

def tamanio_box(x1, x2, y1, y2):
    """ Recibe 2 pares de coordenadas (x1, x2, y1, y2)
        Las resta para calcular el tamanio
        Retorna una tupla (x, y)"""
    
    return (x2 - x1, y2 - y1)


def entra(tam_box_texto, tam_box):  
    """ Recibe el tamanio para el texto máximo fijado del template, 
    y el tamaño de un texto con una fuente determinada
    Retorna un boolean"""  
    return tam_box_texto[0] <= tam_box[0] and tam_box_texto[1] <= tam_box[1]


def calcular_tamanio_texto(meme, texto, box, fuente):
    """ Recibe copia del meme en objeto draw, un string con el texto, un string con el path de la fuente
     y una tupla con el tamaño del box máximo fijado del template 
     Retorna una fuente del un tamaño correcto (mínimo 20)"""
    
    palabras = texto.split(' ')  # Divide el texto en palabras
    texto_con_salto = ''
    for tamanio_actual in range(150, 15, -5):
        fuente_actual = ImageFont.truetype(fuente, tamanio_actual)
        texto_con_salto = ''
        
       
        for palabra in palabras:
            texto_temporal = texto_con_salto + palabra + ' '
            box_texto_temporal = meme.textbbox((0, 0), texto_temporal, font=fuente_actual)
            tam_box_texto_temporal = tamanio_box(box_texto_temporal[0], box_texto_temporal[2], box_texto_temporal[1], box_texto_temporal[3])
            
            if not entra(tam_box_texto_temporal, box):
                texto_con_salto += '\n' + palabra + ' '
            else:
                texto_con_salto += palabra + ' '
        
        texto_con_salto = texto_con_salto.strip()  # Elimina espacios adicionales al inicio y final del texto
        
        box_texto_con_salto = meme.textbbox((0, 0), texto_con_salto, font=fuente_actual)
        tam_box_texto_con_salto = tamanio_box(box_texto_con_salto[0], box_texto_con_salto[2],
                                              box_texto_con_salto[1], box_texto_con_salto[3])
        if entra(tam_box_texto_con_salto, box):
            return fuente_actual, texto_con_salto,True

    return fuente_actual, texto_con_salto,False  # Si no entra en ninguna iteración, devuelve el último tamanio_actual y texto_con_salto


list_colores = ["black", "blue", "purple", "red", "orange", "yellow", "green"]

def cambiarColor (evento, colores):
    num = int(evento[-2]) -1
    color_actual = colores[num]
    indice_actual = list_colores.index(color_actual)
    siguiente_indice = indice_actual + 1
    if (siguiente_indice > 6):
        siguiente_indice = 0
    nuevo_color = list_colores[siguiente_indice]

    return nuevo_color, num


def create_memegen_windows(profile_nick, meme, template, cant_text, max_chars):
    """ Crea la ventana para poder ponerle texto a la imagen y asi crear el meme"""

    # Creo una lista con las fuentes disponibles para el sg.Combo
    opciones_fuentes = ['Impact', 'Helvetica', 'Neucha', 'Hack']
    path_fuentes = {
                'Impact': IMPACT_FONT,
                'Helvetica': HELVETICA,
                'Neucha': NEUCHA,
                'Hack': HACK
            }
    

    texts_fields = []
    for i in range(cant_text):
        texts_fields.append([sg.Text("Texto "+ str(i+1)), sg.Button(key=f'-COLOR-{i+1}-', image_source=COLOR_ICON, image_size=(30, 30), button_color='black', size=(1, 1))])
        texts_fields.append([sg.InputText(key=f'-INPUT-{i+1}-')])

    column1 = sg.Column([
        [sg.Text('Seleccionar fuente')],
        [sg.Combo(opciones_fuentes, key="-COMBO-FUENTE-", readonly=True, size=(20,5))],
        [sg.Column(texts_fields)],
    ])


    column2 = sg.Column([
        [sg.Image(meme, key="-IMAGE-")],
       
    ])

    main_column = sg.Column([[sg.Text('Generar Meme', key="-TEXT-"), sg.Push(),sg.Quit('< Volver', key='-MEME-VOLVER-')], 
                             [column1, column2], 
                             [sg.Button('Previsualizar',key='-UPDATE-'),sg.Push(),sg.Text('Nombre del archivo:',font=('Helvetica', 12) ), sg.InputText(key="-TITULO-MEME-",size=(25,1)) ,sg.Button('Guardar', key = '-SAVE-')]], 
                             key ='-MAIN-COLUMN-', scrollable=True, vertical_scroll_only=True, size=(1350, 700))

    layout = [
        [main_column],
    ]

    meme_vacio = Image.open(meme) 
    
    #Calcular tamaño del texto
    textos = ["","",""]
    colores = ['black' for c in range(cant_text)]

    modifico = False

    collage_window = sg.Window("Generar meme", layout, finalize=True, size=(1350, 700), resizable=True)
    collage_window.set_min_size((1350, 700))
    collage_window['-MAIN-COLUMN-'].vsb.pack_forget() #Hace invisible la barra de scroll

    while True:
        event, values = collage_window.Read()

        collage_window['-IMAGE-'].update(meme_vacio)

        if event == sg.WIN_CLOSED or event== "-MEME-VOLVER-":
            break

        if '-COLOR-' in event:
            nuevo_color, num = cambiarColor(event, colores)
            colores[num] = nuevo_color
            collage_window[f'-COLOR-{num+1}-'].update(button_color = nuevo_color)
            if modifico:       
                collage_window['-IMAGE-'].update(data=meme_mostrar)
            else: 
                collage_window['-IMAGE-'].update(meme)


        if event == '-UPDATE-':
            input_values = [values[f'-INPUT-{i+1}-'] for i in range(cant_text)]
            try:
                if not values['-COMBO-FUENTE-']:
                    if modifico:       
                        collage_window['-IMAGE-'].update(data=meme_mostrar)
                    else: 
                        collage_window['-IMAGE-'].update(meme)
                    raise ValueError('ERROR: Seleccione una fuente')
                if any(value == '' for value in input_values):
                    raise ValueError("Debe ingresar texto en todos los campos requeridos.")
                else:
                    meme_modificado = meme_vacio.copy()
                    draw = ImageDraw.Draw(meme_modificado)
                    opcion_seleccionada = values['-COMBO-FUENTE-']
                        
                    path_fuente = path_fuentes[opcion_seleccionada]

                    texto_largo = False
                    #Para cada una de las cajitas de texto:
                    for i in range (cant_text):
                        # Toma los datos de la caja de texto actual
                        top_left_x = template['text_boxes'][i]['top_left_x']
                        top_left_y = template['text_boxes'][i]['top_left_y']
                        bottom_right_x = template['text_boxes'][i]['bottom_right_x']
                        bottom_right_y = template['text_boxes'][i]['bottom_right_y']

                        # Calcula el tamaño total disponible
                        tam_box = tamanio_box(top_left_x, bottom_right_x, top_left_y, bottom_right_y)

                        texto_actual = values['-INPUT-' + str((i+1)) + '-']
                        texto_actual = texto_actual.upper()
                        textos[i] = texto_actual


                        # Chequea la cantidad maxima de caracteres
                        fuente_resultado, texto_actual, entro = calcular_tamanio_texto(draw, texto_actual, tam_box, path_fuente)
                        
                        # Calcula el tamaño más grande posible
                        if not(entro):
                            texto_largo = True
                            if(modifico):
                                collage_window['-IMAGE-'].update(data=meme_mostrar)
                            else: 
                                collage_window['-IMAGE-'].update(meme)
                            sg.popup(f"El texto {i+1} es demasiado largo",title="WARNING")

                        # Pone el texto en la imagen
                        try:
                            draw.text((top_left_x, top_left_y), texto_actual, font=fuente_resultado, fill=colores[i])
                        except UnboundLocalError:
                            sg.popup('Ingrese texto antes de actualizar')
                    if not texto_largo:
                        meme_mostrar = ImageTk.PhotoImage(meme_modificado)
                        collage_window['-IMAGE-'].update(data=meme_mostrar)
                    modifico = True
            except KeyError:
                if modifico:       
                    collage_window['-IMAGE-'].update(data=meme_mostrar)
                else: 
                    collage_window['-IMAGE-'].update(meme)
                sg.popup('ERROR: Fuente inexistente')
            except ValueError as e:
                if modifico:       
                    collage_window['-IMAGE-'].update(data=meme_mostrar)
                else: 
                    collage_window['-IMAGE-'].update(meme)
                sg.popup(e)
                

        if event == '-SAVE-':
            input_values = [values[f'-INPUT-{i+1}-'] for i in range(cant_text)]
            for i in range(cant_text):
                if textos[i].lower() != input_values[i].lower():
                    if(modifico):
                        collage_window['-IMAGE-'].update(data=meme_mostrar) 
                    else:  
                        collage_window['-IMAGE-'].update(meme)

                    sg.popup("Por favor actualize los cambios antes de guardar")            
                    break       # Sale del bucle for si se cumple la condición
                elif any(value == '' for value in input_values):
                    collage_window['-IMAGE-'].update(meme)
                    sg.popup("Debe ingresar texto en todos los campos requeridos")
                    break
                else:
                    collage_window['-IMAGE-'].update(data=meme_mostrar)
                        
                    if not values['-TITULO-MEME-']:
                        sg.Popup('Ingrese nombre del archivo antes de guardar')
                    else:
                        nombre_archivo = values['-TITULO-MEME-']
                        ruta = rd.get_meme_directory() + nombre_archivo + '.png'
                        ruta = rd.get_relative_path(ruta)

                        meme_modificado = ImageTk.getimage(meme_mostrar)
                        meme_modificado.save(ruta)

                        texto_logs = ';'.join([textos[i] for i in range(len(textos))])
                        add_logs([profile_nick, "Nuevo meme", template['name'], texto_logs])

                        sg.popup(f'Tu meme "{nombre_archivo}.png" se guardó correctamente')

    collage_window.close()