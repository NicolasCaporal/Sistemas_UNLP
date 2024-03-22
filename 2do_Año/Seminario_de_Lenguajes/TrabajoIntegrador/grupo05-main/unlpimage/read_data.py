import os, io
from unlpimage.paths import JSON_FILE, TEMPLATES_FILE, CONFIG_FILE, TAGS_FILE, LOG, DISENIO1, DISENIO2, DISENIO3, DISENIO4, DISENIO5, NEUCHA
import json
import csv
import time
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont


"""
JSON DE PERFILES
"""
def read_profiles():
    try:
        with open(JSON_FILE, "r", encoding='utf-8') as f:
            profiles = json.load(f)
    except FileNotFoundError:
        profiles = {'profiles': []}
    finally:
        return profiles
    # se lee la lista de perfiles del archivo JSON, o se crea una lista vacía si el archivo no existe

def set_profile(profile_list):
    with open(JSON_FILE, 'w') as f:
        json.dump(profile_list, f)



"""
JSON DE TEMPLATES DE MEMES
"""

def read_templates():
    try:
        with open(TEMPLATES_FILE, "r", encoding='utf-8') as f:
            templates = json.load(f)
    except FileNotFoundError:
        templates = [{"image":"NaN"}]
    finally:
        return templates



"""
CSV DE CONFIGURACIÓN
"""

def read_config():
    try:
        with open(CONFIG_FILE, "r", encoding='utf-8') as csvfile:
            csv_reader = csv.reader(csvfile, delimiter=',') 
            encabezado, data = next(csv_reader), list(csv_reader)
    except FileNotFoundError:
        encabezado = ''
        data = [['', '', '']]
    return encabezado, data

def get_repository_directory():
    enc, data = read_config()
    return data[0][0]

def get_collage_directory():
    enc, data = read_config()
    return data[0][1]+"/"
    
def get_meme_directory():
    enc, data = read_config()
    return data[0][2]+"/"

def set_config(new_config):
    enc, dat = read_config()

    if (enc == ''):
        enc = ['Repositorio de imagenes', 'de collague', 'de memes']

    image = new_config[0]
    collage = new_config[1]
    meme = new_config[2]

    with open(CONFIG_FILE, 'w', newline='', encoding='utf-8') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(enc)
        #csvwriter.writerows(f"{image}, {collage}, {meme}")
        csvfile.write(f"{image},{collage},{meme}")




"""
CSV DE LOGS
"""

def read_logs():
    try:
        with open(LOG, "r", encoding='utf-8') as csvfile:
            csv_reader = csv.reader(csvfile, delimiter=',') 
            encabezado, data = next(csv_reader), list(csv_reader)
    except FileNotFoundError:
        encabezado = ''
        data = []
    
    return encabezado, data


def add_logs(new_log):
    #fecha_actual = datetime.datetime.now() # fecha y hora actual
    #fecha = fecha_actual.strftime("%d/%m/%Y, %H:%M:%S") # fecha y hora actual con formato
    fecha = int(time.time())
    new_log.insert(0, fecha)

    enc, dat = read_logs()

    if (enc == ''):
        enc = ['Timestamp','nick','operation','values','texts']
    
    dat.append(new_log)

    with open(LOG, 'w', newline='', encoding='utf-8') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(enc)
        csvwriter.writerows(dat)



"""
FUNCIONES PARA VENTANA DE TAGS
"""

def updateTagsCsv(data):
    #actual_date = datetime.datetime.now() # fecha y hora actual
    #date = actual_date.strftime("%d/%m/%Y") # fecha actual con formato
    date = int(time.time())

    with open(TAGS_FILE, "r", newline='', encoding='utf-8') as csv_file:
            csv_reader = csv.reader(csv_file)
            content_csv = list(csv_reader)

            index = searchImage(data['ruta'], content_csv)

            if data['ruta'] in content_csv[index]:
                updateCsvLine(data, index, date)
            else:
                appendEndCsvFile(data, date)
                    
    
def searchImage (ruta, list_tags_csv):

    for i, rutaAct in enumerate(list_tags_csv):
        if (rutaAct[0] == ruta):
            return i
    return 0

def updateCsvLine(data, index, date):

    #Crea una lista con todos los datos a escribir en el archivo Csv

    listData = [data['ruta'], data['descripcion'], data['resolucion'], data['tamaño'], data['tipo'], data['tags'], data["ultimoPerfil"], date]

    try:
        with open(TAGS_FILE, 'r', encoding='utf-8') as csv_file:
            csv_reader = csv.reader(csv_file)
            content_csv = list(csv_reader)
    except FileNotFoundError:
        enc = ['ruta','descripcion','resolucion','tamaño(mb)','tipo','tags','ultimoPerfil','fechaActualizacion']
        content_csv = enc
    finally:
        content_csv[index] = listData
        with open(TAGS_FILE, "w", newline='', encoding='utf-8') as csv_file:
            csv_writer = csv.writer(csv_file)
            csv_writer.writerows(content_csv)
        
def appendEndCsvFile(data, date):
    
    listData = [data['ruta'], data['descripcion'], data['resolucion'], data['tamaño'], data['tipo'], data['tags'], data["ultimoPerfil"], date]

    with open(TAGS_FILE, mode='a', newline='', encoding='utf-8') as archivo_csv:
        escritor_csv = csv.writer(archivo_csv)       
        escritor_csv.writerow(listData)


def retDataImageTags (dirImagen):
    try:
        with open(TAGS_FILE, "r", newline='', encoding='utf-8') as csv_file:
                csv_reader = csv.reader(csv_file)
                content_csv = list(csv_reader)

                index = searchImage(dirImagen, content_csv)

                if index == 0:
                    return [],"","",""
                else:
                    dato = content_csv[index][5]
                    dato = dato.replace("[", "")
                    dato = dato.replace("]", "")
                    dato = dato.replace("'", "")
                    dato = dato.replace(" ", "")
                    
                    listaDato = dato.split(',')
                    
                    return listaDato, content_csv[index][1],content_csv[index][2],content_csv[index][3]
    except FileNotFoundError:
        return [],"","",""
            
def loadCsvLog(profile_nick, dirImage):  
    try:
        with open(TAGS_FILE, "r", newline='', encoding='utf-8') as csv_file:
            csv_reader = csv.reader(csv_file)
            content_csv = list(csv_reader)

        rta = searchImage(dirImage,content_csv)
        
        if (rta == 0):
            add_logs([profile_nick, "Clasifico una nueva imagen", '', ''])
        else:
            add_logs([profile_nick,"Modifico una imagen previamente clasificada",'', ''])
    except FileNotFoundError:
        enc = ['ruta','descripcion','resolucion','tamaño(mb)','tipo','tags','ultimoPerfil','fechaActualizacion']
        with open(TAGS_FILE, "w", newline='', encoding='utf-8') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow(enc)

"""
FUNCION QUE DEVUELVE LOS BYTES NECESARIOS MOSTRAR UNA IMAGEN
"""

def get_image(image_path, x=600, y=600, resize=True):
    path = Path(image_path)
    profile_image_path = str(path) # lo convierto al so en el que se está ejecutando
    
    if os.path.exists(profile_image_path): # veo si existe
        image = Image.open(profile_image_path)
        if resize:
            image.thumbnail((x, y)) 
        bio = io.BytesIO() # Creo un espacio vacio en RAM donde voy a guardar mi imagen
        image.save(bio, format="PNG")
    return bio.getvalue()

"""
FUNCION QUE DEVUELVE EL PATH RELATIVO DE UNA IMAGEN
"""
def get_relative_path(image_path):
    image_path_abs = os.path.abspath(image_path)
    base_path = os.getcwd()
    image_path_rel = os.path.relpath(image_path_abs, base_path)
    image_path_rel = image_path_rel.replace('\\', '/')
    return image_path_rel

"""
FUNCION QUE PERMITE VERIFICAR SI UNA IMAGEN ESTÁ TAGUEADA O NO
"""
def comprobar_tags(dirImagen):
    try:
        with open(TAGS_FILE, "r", newline='', encoding='utf-8') as csv_file:
                csv_reader = csv.reader(csv_file)
                content_csv = list(csv_reader)

                index = searchImage(dirImagen, content_csv)

                if index == 0:
                    return False
                else:
                    return True
    except FileNotFoundError:
        return False


"""
FUNCIONES USADAS PARA LA VENTANA DE COLLAGES
"""

def get_collage_bytes(collage):
    with io.BytesIO() as output:
        collage.save(output, format="PNG")
        collage_bytes = output.getvalue()
    thumbnail_size = (430, 350) # reducimos el tamaño
    with Image.open(io.BytesIO(collage_bytes)) as collage_image:
        collage_image.thumbnail(thumbnail_size)
        thumbnail_bytes = io.BytesIO()
        collage_image.save(thumbnail_bytes, format="PNG")
        thumbnail_bytes = thumbnail_bytes.getvalue()
    return thumbnail_bytes

def create_collage(num_disenio, rutas_imagenes, titulo, guardar=True):
    match num_disenio:
        case 1:
            if guardar:
                create_desing1(rutas_imagenes, titulo, guardar)
            else:
                return create_desing1(rutas_imagenes, titulo, guardar)
        case 2:
            if guardar:
                create_desing2(rutas_imagenes, titulo, guardar)
            else:
                return create_desing2(rutas_imagenes, titulo, guardar)
        case 3:
            if guardar:
                create_desing3(rutas_imagenes, titulo, guardar)
            else:
                return create_desing3(rutas_imagenes, titulo, guardar)
        case 4:
            if guardar:
                create_desing4(rutas_imagenes, titulo, guardar)
            else:
                return create_desing4(rutas_imagenes, titulo, guardar)
        case 5:
            if guardar:
                create_desing5(rutas_imagenes, titulo, guardar)
            else:
                return create_desing5(rutas_imagenes, titulo, guardar)


"""
DISEÑO 1
"""
def create_desing1(rutas_imagenes, titulo, guardar):
    template = Image.open(DISENIO1)
    im1 = Image.open(rutas_imagenes[0])
    im2 = Image.open(rutas_imagenes[1])

    im1_width, im1_height = im1.size
    im2_width, im2_height = im2.size

    # redimensionamiento de las imágenes si son más grandes que la mitad del ancho del template
    if im1_width > template.width // 2 or im1_height > template.height:
        im1.thumbnail((template.width // 2, template.height))

    if im2_width > template.width // 2 or im2_height > template.height:
        im2.thumbnail((template.width // 2, template.height))

    """
    # EN CASO DE QUERER QUE SE RECORTE
    collage_width = im1.size[0] + im2.size[0] + 1
    collage_height = max(im1.size[1], im2.size[1])
    collage = Image.new("RGB", (collage_width, collage_height), "white") # Creación del collage
    
    
    EN CASO DE QUERER HACER QUE EL COLLAGE SEA DEL TAMAÑO PREDETERMINADO:
    collage_width, collage_height = template.size
    collage = Image.new("RGB", template.size, "white")
    """

    collage_width, collage_height = template.size
    collage = Image.new("RGB", template.size, "white")

    im1_x = (collage.width // 4) - (im1.width // 2)
    im1_y = (collage.height - im1.height) // 2
    im2_x = (collage.width * 3 // 4) - (im2.width // 2)
    im2_y = (collage.height - im2.height) // 2

    collage.paste(im1, (im1_x, im1_y))
    collage.paste(im2, (im2_x, im2_y))

    draw = ImageDraw.Draw(collage)
    line_position = (collage.width // 2, 0)
    draw.line([line_position, (line_position[0], collage.height)], fill="black", width=1)

    #title_font = ImageFont.truetype("arial.ttf", 28)
    title_font = ImageFont.truetype(NEUCHA, 38)  # eligimos una fuente y un tamaño adecuados
    title_position = (10, collage.height - 43)  # posicionamos el título en su lugar
    draw.text(title_position, titulo, fill="black", font=title_font)

    if (guardar):
        ruta = get_collage_directory() + titulo + ".png"
        collage.save(ruta)
    else:
        return get_collage_bytes(collage)
        """
        with io.BytesIO() as output:
            collage.save(output, format="PNG")
            collage_bytes = output.getvalue()
        thumbnail_size = (430, 350) # reducimos el tamaño
        with Image.open(io.BytesIO(collage_bytes)) as collage_image:
            collage_image.thumbnail(thumbnail_size)
            thumbnail_bytes = io.BytesIO()
            collage_image.save(thumbnail_bytes, format="PNG")
            thumbnail_bytes = thumbnail_bytes.getvalue()
        return thumbnail_bytes
        """


"""
DISEÑO 2
"""
def create_desing2(rutas_imagenes, titulo, guardar):
    template = Image.open(DISENIO2)
    im1 = Image.open(rutas_imagenes[0])
    im2 = Image.open(rutas_imagenes[1])

    target_height = template.height // 2
    target_width = template.width // 2

    im1_width, im1_height = im1.size
    im2_width, im2_height = im2.size

    # redimensionamiento de las imágenes si son más grandes que la mitad del ancho del template
    if im1_width > template.width // 2 or im1_height > template.height:
        im1.thumbnail((template.width // 2, template.height // 2))

    if im2_width > template.width // 2 or im2_height > template.height:
        im2.thumbnail((template.width // 2, template.height // 2))

    """
    # EN CASO DE QUERER QUE SE RECORTE
    collage_width = max(im1.size[0], im2.size[0])
    collage_height = im1.size[1] + im2.size[1] + 1
    collage = Image.new("RGB", (collage_width, collage_height), "white")  # Creación del collage
    
    
    EN CASO DE QUERER HACER QUE EL COLLAGE SEA DEL TAMAÑO PREDETERMINADO:
    collage_width, collage_height = template.size
    collage = Image.new("RGB", template.size, "white")
    """

    collage_width, collage_height = template.size
    collage = Image.new("RGB", template.size, "white")

    # calculamos las coordenadas de pegado para centrar las imágenes horizontalmente
    im1_x = (collage_width - im1.width) // 2
    im1_y = (target_height - im1.height) // 2
    im2_x = (collage_width - im2.width) // 2
    im2_y = target_height + 2 + (target_height - im2.height) // 2

    collage.paste(im1, (im1_x, im1_y))
    collage.paste(im2, (im2_x, im2_y))

    draw = ImageDraw.Draw(collage)
    line_position_horizontal = target_height + 1  # separacion vertical y espacio para la linea
    draw.line([(0, line_position_horizontal), (collage_width, line_position_horizontal)], fill="black", width=1)

    title_font = ImageFont.truetype(NEUCHA, 38)  # eligimos una fuente y un tamaño adecuados
    title_position = (10, collage.height - 43)  # posicionamos el título en su lugar
    draw.text(title_position, titulo, fill="black", font=title_font)

    if (guardar):
        ruta = get_collage_directory() + titulo + ".png"
        collage.save(ruta)
    else:
        return get_collage_bytes(collage)


"""
DISEÑO 3
"""
def create_desing3(rutas_imagenes, titulo, guardar):
    template = Image.open(DISENIO3)
    im1 = Image.open(rutas_imagenes[0])
    im2 = Image.open(rutas_imagenes[1])
    im3 = Image.open(rutas_imagenes[2])
    im4 = Image.open(rutas_imagenes[3])

    # calculamos las dimensiones para luego hacer los thumbails
    target_width = template.width // 2
    target_height = template.height // 2

    # calculamos las relaciones de aspecto de las imagenes originales
    aspect_ratio1 = im1.width / im1.height
    aspect_ratio2 = im2.width / im2.height
    aspect_ratio3 = im3.width / im3.height
    aspect_ratio4 = im4.width / im4.height

    # calculamos las thumnail manteniendo las relaciones de aspecto
    thumbnail_width1 = target_width
    thumbnail_height1 = int(thumbnail_width1 / aspect_ratio1)

    thumbnail_width2 = target_width
    thumbnail_height2 = int(thumbnail_width2 / aspect_ratio2)

    thumbnail_width3 = target_width
    thumbnail_height3 = int(thumbnail_width3 / aspect_ratio3)

    thumbnail_width4 = target_width
    thumbnail_height4 = int(thumbnail_width4 / aspect_ratio4)

    # calculamos la altura máxima de la thumbail para que quepa en el collage
    max_thumbnail_height = target_height

    # ajustamos los thumbnail si es necesario para que encajen dentro del collage.
    if thumbnail_height1 > max_thumbnail_height:
        thumbnail_height1 = max_thumbnail_height
        thumbnail_width1 = int(thumbnail_height1 * aspect_ratio1)

    if thumbnail_height2 > max_thumbnail_height:
        thumbnail_height2 = max_thumbnail_height
        thumbnail_width2 = int(thumbnail_height2 * aspect_ratio2)

    if thumbnail_height3 > max_thumbnail_height:
        thumbnail_height3 = max_thumbnail_height
        thumbnail_width3 = int(thumbnail_height3 * aspect_ratio3)

    if thumbnail_height4 > max_thumbnail_height:
        thumbnail_height4 = max_thumbnail_height
        thumbnail_width4 = int(thumbnail_height4 * aspect_ratio4)

    im1.thumbnail((thumbnail_width1, thumbnail_height1))
    im2.thumbnail((thumbnail_width2, thumbnail_height2))
    im3.thumbnail((thumbnail_width3, thumbnail_height3))
    im4.thumbnail((thumbnail_width4, thumbnail_height4))

    # calculamos el tamaño del collage
    collage_width = target_width * 2
    collage_height = target_height * 2 #+4->si quiero incluir + espacio para las lineas->ojo que aumentan los px de la im

    collage = Image.new("RGB", (collage_width, collage_height), "white")

    # calculamos las coordenadas para pegar las imagenes en el collage (centradas)
    im1_x = (target_width - im1.width) // 2
    im1_y = (target_height - im1.height) // 2
    im2_x = target_width + 2 + (target_width - im2.width) // 2  # separacion horizontal
    im2_y = (target_height - im2.height) // 2
    im3_x = (target_width - im3.width) // 2
    im3_y = target_height + 2 + (target_height - im3.height) // 2  # separacion vertical y espacio para la linea
    im4_x = target_width + 2 + (target_width - im4.width) // 2  # separacion horizontal
    im4_y = target_height + 2 + (target_height - im4.height) // 2  # separacion vertical y espacio para la linea

    collage.paste(im1, (im1_x, im1_y))
    collage.paste(im2, (im2_x, im2_y))
    collage.paste(im3, (im3_x, im3_y))
    collage.paste(im4, (im4_x, im4_y))

    # dibujamos las lineas en el collage
    draw = ImageDraw.Draw(collage)
    line_position = (collage.width // 2, 0)
    draw.line([line_position, (line_position[0], collage.height)], fill="black", width=1)
    line_position_horizontal = target_height + 1  # separacion vertical y espacio para la linea
    draw.line([(0, line_position_horizontal), (collage_width, line_position_horizontal)], fill="black", width=1)

    title_font = ImageFont.truetype(NEUCHA, 38)  # eligimos una fuente y un tamaño adecuados
    title_position = (10, collage.height - 43)  # posicionamos el título en su lugar
    draw.text(title_position, titulo, fill="black", font=title_font)

    if (guardar):
        ruta = get_collage_directory() + titulo + ".png"
        collage.save(ruta)
    else:
        return get_collage_bytes(collage)

"""
DISEÑO 4
"""
def create_desing4(rutas_imagenes, titulo, guardar):
    template = Image.open(DISENIO4)
    im1 = Image.open(rutas_imagenes[0])
    im2 = Image.open(rutas_imagenes[1])
    im3 = Image.open(rutas_imagenes[2])

    # calculamos las dimensiones para luego hacer los thumbails
    target_width = template.width // 2
    target_height = template.height // 2

    # calculamos las relaciones de aspecto de las imagenes originales
    aspect_ratio1 = im1.width / im1.height
    aspect_ratio2 = im2.width / im2.height
    aspect_ratio3 = im3.width / im3.height

    # calculamos las thumnail manteniendo las relaciones de aspecto
    thumbnail_width1 = target_width
    thumbnail_height1 = int(thumbnail_width1 / aspect_ratio1)

    thumbnail_width2 = target_width
    thumbnail_height2 = int(thumbnail_width2 / aspect_ratio2)

    thumbnail_width3 = target_width
    thumbnail_height3 = int(thumbnail_width3 / aspect_ratio3)

    # calculamos la altura máxima de la thumbail para que quepa en el collage
    max_thumbnail_height = target_height

    # ajustamos los thumbnail si es necesario para que encajen dentro del collage.
    if thumbnail_height1 > max_thumbnail_height:
        thumbnail_height1 = max_thumbnail_height
        thumbnail_width1 = int(thumbnail_height1 * aspect_ratio1)

    if thumbnail_height2 > max_thumbnail_height:
        thumbnail_height2 = max_thumbnail_height
        thumbnail_width2 = int(thumbnail_height2 * aspect_ratio2)

    if thumbnail_height3 > max_thumbnail_height:
        thumbnail_height3 = max_thumbnail_height
        thumbnail_width3 = int(thumbnail_height3 * aspect_ratio3)

    im1.thumbnail((thumbnail_width1, thumbnail_height1))
    im2.thumbnail((thumbnail_width2, thumbnail_height2))
    im3.thumbnail((thumbnail_width3, thumbnail_height3))

    # calculamos el tamaño del collage
    collage_width = target_width * 2
    collage_height = target_height * 2 #+4->si quiero incluir + espacio para las lineas->ojo que aumentan los px de la im

    collage = Image.new("RGB", (collage_width, collage_height), "white")

    im1_x = (collage_width - im1.width) // 2
    im1_y = (target_height - im1.height) // 2
    im2_x = (target_width - im2.width) // 2
    im2_y = target_height + 2 + (target_height - im2.height) // 2  # separacion vertical y espacio para la linea
    im3_x = target_width + 2 + (target_width - im3.width) // 2  # separacion horizontal
    im3_y = target_height + 2 + (target_height - im3.height) // 2
    

    collage.paste(im1, (im1_x, im1_y))
    collage.paste(im2, (im2_x, im2_y))
    collage.paste(im3, (im3_x, im3_y))

    draw = ImageDraw.Draw(collage)
    line_position_horizontal = target_height + 1  # separacion vertical y espacio para la linea
    draw.line([(0, line_position_horizontal), (collage_width, line_position_horizontal)], fill="black", width=1)
    center_x = collage.width // 2
    center_y = collage.height // 2
    line_position_down = (center_x, center_y)
    draw.line([line_position_down, (line_position_down[0], collage.height)], fill="black", width=1)

    title_font = ImageFont.truetype(NEUCHA, 38)  # eligimos una fuente y un tamaño adecuados
    title_position = (10, collage.height - 43)  # posicionamos el título en su lugar
    draw.text(title_position, titulo, fill="black", font=title_font)

    if (guardar):
        ruta = get_collage_directory() + titulo + ".png"
        collage.save(ruta)
    else:
        return get_collage_bytes(collage)


"""
DISEÑO 5
"""
def create_desing5(rutas_imagenes, titulo, guardar):
    template = Image.open(DISENIO5)
    im1 = Image.open(rutas_imagenes[0])
    im2 = Image.open(rutas_imagenes[1])
    im3 = Image.open(rutas_imagenes[2])

    # calculamos las dimensiones para luego hacer los thumbails
    target_width = template.width // 2
    target_height = template.height // 2

    # calculamos las relaciones de aspecto de las imagenes originales
    aspect_ratio1 = im1.width / im1.height
    aspect_ratio2 = im2.width / im2.height
    aspect_ratio3 = im3.width / im3.height

    # calculamos las thumnail manteniendo las relaciones de aspecto
    thumbnail_width1 = target_width
    thumbnail_height1 = int(thumbnail_width1 / aspect_ratio1)

    thumbnail_width2 = target_width
    thumbnail_height2 = int(thumbnail_width2 / aspect_ratio2)

    thumbnail_width3 = target_width
    thumbnail_height3 = int(thumbnail_width3 / aspect_ratio3)

    # calculamos la altura máxima de la thumbail para que quepa en el collage
    max_thumbnail_height = target_height

    # ajustamos los thumbnail si es necesario para que encajen dentro del collage.
    if thumbnail_height1 > max_thumbnail_height:
        thumbnail_height1 = max_thumbnail_height
        thumbnail_width1 = int(thumbnail_height1 * aspect_ratio1)

    if thumbnail_height2 > max_thumbnail_height:
        thumbnail_height2 = max_thumbnail_height
        thumbnail_width2 = int(thumbnail_height2 * aspect_ratio2)

    if thumbnail_height3 > max_thumbnail_height:
        thumbnail_height3 = max_thumbnail_height
        thumbnail_width3 = int(thumbnail_height3 * aspect_ratio3)

    im1.thumbnail((thumbnail_width1, thumbnail_height1))
    im2.thumbnail((thumbnail_width2, thumbnail_height2))
    im3.thumbnail((thumbnail_width3, thumbnail_height3))

    # calculamos el tamaño del collage
    collage_width = target_width * 2
    collage_height = target_height * 2 #+4->si quiero incluir + espacio para las lineas->ojo que aumentan los px de la im

    collage = Image.new("RGB", (collage_width, collage_height), "white")

    im1_x = (target_width - im1.width) // 2
    im1_y = (target_height - im1.height) // 2
    im2_x = target_width + 2 + (target_width - im2.width) // 2  # separacion horizontal
    im2_y = (target_height - im2.height) // 2
    im3_x = (collage_width - im3.size[0]) // 2
    im3_y = target_height + 2 + (target_height - im3.height) // 2

    collage.paste(im1, (im1_x, im1_y))
    collage.paste(im2, (im2_x, im2_y))
    collage.paste(im3, (im3_x, im3_y))

    draw = ImageDraw.Draw(collage)
    line_position_horizontal = target_height + 1  # separacion vertical y espacio para la linea
    draw.line([(0, line_position_horizontal), (collage_width, line_position_horizontal)], fill="black", width=1)
    
    center_x = collage.width // 2
    center_y = collage.height // 2
    line_position_up = (center_x, 0)
    draw.line([line_position_up, (line_position_up[0], center_y)], fill="black", width=1)

    title_font = ImageFont.truetype(NEUCHA, 38)  # eligimos una fuente y un tamaño adecuados
    title_position = (10, collage.height - 43)  # posicionamos el título en su lugar
    draw.text(title_position, titulo, fill="black", font=title_font)

    if (guardar):
        ruta = get_collage_directory() + titulo + ".png"
        collage.save(ruta)
    else:
        return get_collage_bytes(collage)


"""
FUNCIONES USADAS EN VENTANA DE MEMES
"""

def get_template_bytes(template):
    with open(template, "rb") as file:
        imagen_bytes = file.read()
    thumbnail_size = (283, 282)
    with Image.open(io.BytesIO(imagen_bytes)) as collage_image:
        collage_image.thumbnail(thumbnail_size)
        thumbnail_bytes = io.BytesIO()
        collage_image.save(thumbnail_bytes, format="PNG")
        thumbnail_bytes = thumbnail_bytes.getvalue()
    return thumbnail_bytes


