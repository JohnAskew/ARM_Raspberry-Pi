TARGET=Textures.xbt

IMAGES := $(shell find . -name "*jpg")
IMAGES += $(shell find . -name "*png")
IMAGES += $(shell find . -name "*gif")

all: $(TARGET)

.PHONY: force

$(TARGET): $(IMAGES)
ifeq (arm,arm)
	/opt/xbmc-bcm/xbmc-dbg/i686-linux-gnu-native/bin/TexturePacker -use_none -input . -output $(TARGET)
else
	/opt/xbmc-bcm/xbmc-dbg/i686-linux-gnu-native/bin/TexturePacker -input . -output $(TARGET)

endif

clean:
	rm -f $(TARGET)
distclean: clean

