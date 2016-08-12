# #{prefix} stores /usr/local/Cellar/video_queue/1.0.8
# Use prefix solely to store the two executables into cellar

MKDIR_P             = mkdir -p
TOUCH               = touch

# ******************************
DEST_DIR             = /usr/local/video_queue_dir

TEMP_DIR						= ${PREFIX}/bin
DOWNLOADED_DIR      = ${DEST_DIR}/downloaded
TO_WATCH_DIR        = ${DEST_DIR}/to_watch
WATCHED_DIR         = ${DEST_DIR}/watched
# VIDS_TO_DOWNLOAD    = ${DEST_DIR}/videos_to_download.txt
VIDS_TO_DOWNLOAD    = ${TEMP_DIR}/videos_to_download.txt

# ****************************
BINARY_NAME 				= video_queue1
MANPAGE_NAME				= video_queue1.1
SPLITTING_VIDEOS_SH = splitting_videos.sh
FFSPLIT_SH          = ffsplit.sh

# ****************************
LOCAL               = /usr/local
BINDIR              = $(PREFIX)/bin
MANDIR              = $(PREFIX)/share/man/man1

# ****************************
all: create_directories install

create_directories:
	${MKDIR_P} ${DOWNLOADED_DIR} ${TO_WATCH_DIR} ${WATCHED_DIR}
	${MKDIR_P} ${TEMP_DIR} ${BINDIR} ${MANDIR}
	touch ${VIDS_TO_DOWNLOAD}

install:
	install $(SPLITTING_VIDEOS_SH) $(BINDIR)/$(BINARY_NAME)
	install $(FFSPLIT_SH) $(BINDIR)/ff_split
	install $(MANPAGE_NAME) $(MANDIR)/$(MANPAGE_NAME)
	# install 	/usr/share/man/man1/video_queue.1

clean:
	rm -rf ${DEST_DIR}
	rm $(BINDIR)/$(BINARY_NAME)
	rm $(BINDIR)/ff_split
	rm $(MANDIR)/$(MANPAGE_NAME)
