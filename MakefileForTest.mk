ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

SYZYGY_SOURCE="https://syzygy-tables.info/download.txt?source=sesse&max-pieces=5"
SYZYGY_DESTINATION=${ROOT_DIR}/data/syzygy-tables/

STOCKFISH_ZIP_FILE=stock.tar
STOCKFISH_SOURCE="https://drive.google.com/file/d/1kqmgrZ2_1RwyUjAl6BOktkJx9mcSW3xG"
STOCKFISH_DESTINATION=${ROOT_DIR}/stockfish/

DATA_SOURCE="https://drive.google.com/drive/folders/1tvkuiaN-oXC7UAjUw-6cIl1PB0r2as7Y?usp=sharing"
DATA_DESTINATION=${ROOT_DIR}/data/

.PHONY: init
init:  chipiron/data


chipiron/data:
	echo "downloading Data"
	gdown --folder ${DATA_SOURCE} -O ${DATA_DESTINATION}