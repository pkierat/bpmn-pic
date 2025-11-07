TARGET := bpmn.pic

MODULES := shapes.m4 icons.m4 events.m4 gateways.m4 activities.m4 flows.m4 pools.m4 dsl.m4

all: $(TARGET)

$(TARGET): $(MODULES)

%.pic: %.m4
	m4 $< > $@

clean:
	rm -f $(TARGET)
