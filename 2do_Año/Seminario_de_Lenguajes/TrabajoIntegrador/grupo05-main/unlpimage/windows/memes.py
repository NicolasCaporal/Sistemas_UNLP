"""
Ventana que dependiendo la plantilla de meme elegida llama a la ventana memegen,
que permitirá crear un meme a partir de los textos ingresados.
"""
from unlpimage.paths import MEME1, MEME2, MEME3, MEME4, MEME5
from unlpimage import read_data as rd
import PySimpleGUI as sg
from unlpimage.windows import memegen

def get_selected_template(template_name, templates):
    # for template in templates:
    #     if template["name"] == template_name:
    #         return template
    return [t for t in templates if t["name"] == template_name]

def create_meme_windows(profile_nick):
    templates = rd.read_templates()

    # for i in range(len(templates)): 
    #   opciones.append(templates[i]["name"])

    opciones = list(map(lambda template: template["name"], templates)) # creamos una lista con los diseños de los campos de selección de imágenes

    column1 = [
        [sg.Combo(opciones, default_value=opciones[0], key="-TEMPLATE-ELEGIDO-", readonly=True, size=(15,1))],
    ]
    
    column2 = [
        [sg.Image(rd.get_image(MEME1, 1500, 700), key="-IMAGE-SHOW-", size=(300, 300), subsample=(2))],
        [sg.Push(), sg.Button('Previsualizar', key="-MOSTRAR-MEME-"), sg.Submit('Generar',key="-GENERATE-")],
    ]
    
    layout = [
        [sg.Column(
        [
            [sg.Text('Generar meme'), sg.Push(), sg.Button('< Volver', key='-MEMES-VOLVER-')],
            [sg.Text('Seleccionar template'), sg.Push(), sg.Text("Previsualizacion")],
            [sg.Column(column1, vertical_alignment="top"), sg.Push(), sg.Column(column2)],
        ],
        justification='center', element_justification='center', vertical_alignment='center', expand_x=True, expand_y=True
        )],
    ]

    memes_window = sg.Window("Memes", layout, finalize=True, size=(650, 450), resizable=True)
    while True:
        event, values = memes_window.Read()
        if event == sg.WIN_CLOSED or event== "-MEMES-VOLVER-":
            break
        elif event == '-MOSTRAR-MEME-':
            meme_elegido = values["-TEMPLATE-ELEGIDO-"]
            #template_elegido = get_selected_template(meme_elegido, templates)
            match meme_elegido:
                case "Bob esponja fuerte":
                    imagen_bytes = rd.get_template_bytes(MEME1)
                    memes_window["-IMAGE-SHOW-"].update(data=imagen_bytes, size=(300, 300))
                case "Grita internamente":
                    imagen_bytes = rd.get_template_bytes(MEME2)
                    memes_window["-IMAGE-SHOW-"].update(data=imagen_bytes, size=(300, 300))
                case "Homero escondiéndose":
                    imagen_bytes = rd.get_template_bytes(MEME3)
                    memes_window["-IMAGE-SHOW-"].update(data=imagen_bytes, size=(300, 300))
                case "Joe sorprendido":
                    imagen_bytes = rd.get_template_bytes(MEME4)
                    memes_window["-IMAGE-SHOW-"].update(data=imagen_bytes, size=(300, 300))
                case "Winie pooh caballero":
                    imagen_bytes = rd.get_template_bytes(MEME5)
                    memes_window["-IMAGE-SHOW-"].update(data=imagen_bytes, size=(300, 300))
        elif event == '-GENERATE-':
            meme_elegido = values["-TEMPLATE-ELEGIDO-"]
            template_elegido = get_selected_template(meme_elegido, templates)
            template_elegido = template_elegido[0]
            memes_window.hide()
            match meme_elegido:
                case "Bob esponja fuerte":
                    memegen.create_memegen_windows(profile_nick, MEME1, template_elegido, 3, 175)
                case "Grita internamente":
                    memegen.create_memegen_windows(profile_nick, MEME2, template_elegido, 1, 330)
                case "Homero escondiéndose":
                    memegen.create_memegen_windows(profile_nick, MEME3, template_elegido, 2, 300)
                case "Joe sorprendido":
                    memegen.create_memegen_windows(profile_nick, MEME4, template_elegido, 2, 250)
                case "Winie pooh caballero":
                    memegen.create_memegen_windows(profile_nick, MEME5, template_elegido, 3, 200)
            memes_window.un_hide()
    
    memes_window.close()