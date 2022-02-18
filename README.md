# Building QML Task 1

### Build on Ubuntu
1. Setup Qt on ubuntu (tested version Qt 5.15.2 with GCC)
2. Clone the repo:`git clone https://github.com/toniburovski/uniqcast_t1.git`
3. Open `UniqCast.pro` with Qt-creator and run the project


### Codecs install
The app could require additional packages to be installed for playing video:

	sudo apt install gstreamer1.0-libav
	sudo apt-get install gstreamer1.0-plugins-bad:amd64
