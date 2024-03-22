import os
PATH_RAIZ = os.path.abspath(os.path.dirname(__file__))

PATH_DOCS = os.path.join(PATH_RAIZ, "documents")
PATH_ALL_IMAGES = os.path.join(PATH_RAIZ, "images")
PATH_IMAGES = os.path.join(PATH_ALL_IMAGES, "profileimages")
PATH_CONFIG = os.path.join(PATH_RAIZ, "config")
PATH_APP_IMAGES = os.path.join(PATH_ALL_IMAGES, "appimages")
FONT_FOLDER = os.path.join(PATH_RAIZ, "fonts")

PATH_ICON = os.path.join(PATH_APP_IMAGES, "appicon.ico")
DEFAULT_IMAGE = os.path.join(PATH_IMAGES, "default.png")
SETTINGS_IMAGE = os.path.join(PATH_APP_IMAGES, "setting.png")
HELP_IMAGE = os.path.join(PATH_APP_IMAGES, "help.png")
COLOR_ICON = os.path.join(PATH_APP_IMAGES, "color.png")

JSON_FILE = os.path.join(PATH_DOCS, "profiles.json")
CONFIG_FILE = os.path.join(PATH_CONFIG, "config.csv")
TAGS_FILE = os.path.join(PATH_DOCS, "tags.csv")
TEMPLATES_FILE = os.path.join(PATH_DOCS, "templates.json")

COLLAGES_FOLDER = os.path.join(PATH_ALL_IMAGES, "collages")
MEMES_FOLDER = os.path.join(PATH_ALL_IMAGES, "memes")
REPO_FOLDER = os.path.join(PATH_ALL_IMAGES, "repositorio")
MEMES_TEMPLATES = os.path.join(PATH_ALL_IMAGES, "memes_templates")

LOG = os.path.join(PATH_CONFIG, "logs.csv")

COLLAGE_TEMPLATES = os.path.join(PATH_ALL_IMAGES, "collage_templates")
DISENIO1 = os.path.join(COLLAGE_TEMPLATES, "diseño1.png")
DISENIO2 = os.path.join(COLLAGE_TEMPLATES, "diseño2.png")
DISENIO3 = os.path.join(COLLAGE_TEMPLATES, "diseño3.png")
DISENIO4 = os.path.join(COLLAGE_TEMPLATES, "diseño4.png")
DISENIO5 = os.path.join(COLLAGE_TEMPLATES, "diseño5.png")

MEME1 = os.path.join(MEMES_TEMPLATES, "Plantilla-bob-esponja.png")
MEME2 = os.path.join(MEMES_TEMPLATES, "Plantilla-grita-internamente.png")
MEME3 = os.path.join(MEMES_TEMPLATES, "Plantilla-homero.png")
MEME4 = os.path.join(MEMES_TEMPLATES, "Plantilla-joe-friends.png")
MEME5 = os.path.join(MEMES_TEMPLATES, "Plantilla-winie-pooh.png")

IMPACT_FONT = os.path.join(FONT_FOLDER, "impact.ttf")
HELVETICA = os.path.join(FONT_FOLDER, "freeSansBold.ttf")
NEUCHA = os.path.join(FONT_FOLDER, "Neucha.ttf")
OPENSANS = os.path.join(FONT_FOLDER, "OpenSans-Regular.ttf")
HACK = os.path.join(FONT_FOLDER, "Hack-Bold.ttf")

# PATHS RELATIVOS
REL_RAIZ = os.path.relpath(os.path.dirname(__file__))

REL_DOCS = os.path.join(REL_RAIZ, "documents")
REL_ALL_IMAGES = os.path.join(REL_RAIZ, "images")
REL_IMAGES = os.path.join(REL_ALL_IMAGES, "profileimages")
REL_CONFIG = os.path.join(REL_RAIZ, "config")
REL_APP_IMAGES = os.path.join(REL_ALL_IMAGES, "appimages")

REL_ICON = os.path.join(REL_APP_IMAGES, "appicon.ico")
REL_DEFAULT_IMAGE = os.path.join(REL_IMAGES, "default.png")
REL_SETTINGS_IMAGE = os.path.join(REL_APP_IMAGES, "setting.png")
REL_HELP_IMAGE = os.path.join(REL_APP_IMAGES, "help.png")

REL_JSON_FILE = os.path.join(REL_DOCS, "profiles.json")
REL_CONFIG_FILE = os.path.join(REL_CONFIG, "config.csv")

REL_COLLAGES_FOLDER = os.path.join(REL_ALL_IMAGES, "collages")
REL_MEMES_FOLDER = os.path.join(REL_ALL_IMAGES, "memes")

REL_LOG = REL_JSON_FILE = os.path.join(REL_CONFIG, "logs.csv")