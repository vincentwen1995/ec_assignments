JC = javac
JC_FLAGS = -cp
JVM = java
JZIP = jar
MAIN_CLASS = player19.java
EXCLUDED = \
		BentCigarFunction.java \
		KatsuuraEvaluation.java \
		SchaffersEvaluation.java \
		SphereEvaluation.java
CLASSES := $(filter-out $(EXCLUDED),$(wildcard *.java))
RM := 
ifeq ($(OS),Windows_NT)
	@RM = del
else
	@RM = rm
endif
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JC_FLAGS) contest.jar $(MAIN_CLASS) $(CLASSES)
default: classes runtime submission
classes: $(MAIN_CLASS:.java=.class) $(CLASSES:.java=.class)
runtime:
	$(JZIP) uf testrun.jar $(filter-out $(EXCLUDED:.java=.class),$(wildcard *.class))
submission:
	$(JZIP) cmf MainClass.txt submission.jar $(MAIN_CLASS:.java=.class) $(filter-out $(EXCLUDED:.java=.class),$(wildcard *.class))
clean:
	$(RM) $(MAIN_CLASS:.java=.class) $(CLASSES:.java=.class)